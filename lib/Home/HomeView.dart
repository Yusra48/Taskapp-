import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/MainScreen.dart';
import 'package:flutter_application_1/Models/Theme/ThemeProvider.dart';
import 'package:flutter_application_1/Navigations/ChatPage/ChatPage.dart';
import 'package:flutter_application_1/Navigations/ProjectPage/ProjectPage.dart';
import 'package:flutter_application_1/Navigations/bottomsheet/TodayTasksPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/Navigations/Profile/ProfileView.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TodayTasksPage(),
                ),
              );
            },
          ),
        ),
        title: Text(
          _getFormattedDate(),
          style: GoogleFonts.ubuntu(
            textStyle: TextStyle(
              letterSpacing: 1,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
        ),
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
      bottomNavigationBar: _buildBottomNavigationBar(colorScheme, themeData),
    );
  }

  String _getFormattedDate() {
    return DateFormat('EEEE, d MMMM').format(DateTime.now());
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

  BottomNavigationBar _buildBottomNavigationBar(ColorScheme colorScheme, ThemeData themeData) {
    return BottomNavigationBar(
      backgroundColor: colorScheme.surface,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepPurpleAccent,
      unselectedItemColor:Colors.grey[800],
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(color: Colors.deepPurpleAccent),
      unselectedLabelStyle: TextStyle(color: Colors.grey),
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        _handleBottomNavTap(index);
      },
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
            backgroundColor:Colors.deepPurpleAccent,
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

  void _handleBottomNavTap(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProjectsPage(),
          ),
        );
        break;
      case 2:
        _showModalSheet(context);
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(),
          ),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfileView(),
          ),
        );
        break;
    }
  }

  void _showModalSheet(BuildContext context) {
    final themeData = Provider.of<ThemeProvider>(context).themeData;
    final colorScheme = themeData.colorScheme;

    showModalBottomSheet(
      context: context,
      backgroundColor: colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildListTile(
              icon: Icons.create,
              title: 'Create Task',
              onTap: () => Navigator.pushNamed(context, '/createTask'),
            ),
            _buildListTile(
              icon: Icons.folder_sharp,
              title: 'Create Project',
              onTap: () => Navigator.pushNamed(context, '/createProject'),
            ),
            _buildListTile(
              icon: Icons.group,
              title: 'Create Team',
              onTap: () => Navigator.pushNamed(context, '/createTeam'),
            ),
            _buildListTile(
              icon: Icons.event,
              title: 'Create Event',
              onTap: () => Navigator.pushNamed(context, '/createEvent'),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.deepPurpleAccent,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16),
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildListTile({required IconData icon, required String title, required VoidCallback onTap}) {
    final themeData = Provider.of<ThemeProvider>(context).themeData;
    final colorScheme = themeData.colorScheme;

    return ListTile(
      leading: Icon(
        icon,
        color: colorScheme.onSurface,
        size: 20,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurface,
        ),
      ),
      onTap: onTap,
    );
  }
}
