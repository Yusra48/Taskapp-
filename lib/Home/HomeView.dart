import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/DateController.dart';
import 'package:flutter_application_1/Home/HomeController.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/Home/MainScreen.dart';
import 'package:flutter_application_1/Models/Theme/ThemeProvider.dart';
import 'package:flutter_application_1/Navigations/bottomsheet/TodayTasksPage.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
      final DateController dateController = Get.put(DateController());
    final themeProvider = Get.put(ThemeProvider());
    final themeData = themeProvider.themeData;
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey[50]!),
          ),
          child: IconButton(
            icon: Icon(
              Icons.qr_code_rounded,
              size: 30,
              color: colorScheme.onSurface,
            ),
            onPressed: () => Get.to(() => const TodayTasksPage()),
          ),
        ),
        title: Obx(() {
          return Text(
            dateController.formattedDate.value,
            style: GoogleFonts.ubuntu(
              textStyle: TextStyle(
                letterSpacing: 1,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          );
        }),
        actions: [
          _buildIcon(
            icon: Icons.notifications_none_sharp,
            color: colorScheme.onSurface,
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _buildGreetingText(colorScheme, textTheme),
        ),
      ),
      bottomNavigationBar: Obx(() => _buildBottomNavigationBar(colorScheme, themeData, controller)),
    );
  }



  Widget _buildIcon({required IconData icon, required Color color}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey[50]!),
        ),
        child: Icon(
          icon,
          size: 30,
          color: color,
        ),
      ),
    );
  }

  Widget _buildGreetingText(ColorScheme colorScheme, TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 5, right: 30),
          child: Text(
            "Let's Make a Habit Together 🤝",
            style: GoogleFonts.b612(
              textStyle: TextStyle(
                letterSpacing: 2,
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: colorScheme.onSurface,
              ),
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: 10),
        const MainScreen(),
      ],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(ColorScheme colorScheme, ThemeData themeData, HomeController controller) {
    return BottomNavigationBar(
      backgroundColor: colorScheme.surface,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepPurpleAccent,
      unselectedItemColor: Colors.grey[800],
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(color: Colors.deepPurpleAccent),
      unselectedLabelStyle: TextStyle(color: Colors.grey),
      currentIndex: controller.currentIndex.value,
      onTap: (index) => controller.onBottomNavTap(index),
      items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.folder_open),
          label: 'Projects',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundColor: Colors.deepPurpleAccent,
            child: Icon(CupertinoIcons.add, color: Colors.white),
            radius: 25,
          ),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.chat_bubble_text),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person_circle),
          label: 'Profile',
        ),
      ],
    );
  }
}
