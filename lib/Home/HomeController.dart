import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/Models/Theme/ThemeProvider.dart';
import 'package:flutter_application_1/Navigations/ChatPage/ChatPage.dart';
import 'package:flutter_application_1/Navigations/ProjectPage/ProjectPage.dart';
import 'package:flutter_application_1/Navigations/Profile/ProfileView.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;

  void onBottomNavTap(int index) {
    currentIndex.value = index;
    switch (index) {
      case 0:
        break;
      case 1:
        Get.to(() => const ProjectsPage());
        break;
      case 2:
        _showModalSheet();
        break;
      case 3:
        Get.to(() => const ChatPage());
        break;
      case 4:
        Get.to(() => const ProfileView());
        break;
    }
  }

  String getFormattedDate() {
    try {
      final DateFormat dateFormat = DateFormat('EEEE, d MMMM');
      return dateFormat.format(DateTime.now());
    } catch (e) {
      print('Error formatting date: $e');
      return 'Date format error';
    }
  }

  void _showModalSheet() {
    final themeData = Get.find<ThemeProvider>().themeData;
    final colorScheme = themeData.colorScheme;

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildListTile(
              icon: Icons.create,
              title: 'Create Task',
              onTap: () => Get.toNamed('/createTask'),
            ),
            _buildListTile(
              icon: Icons.folder_sharp,
              title: 'Create Project',
              onTap: () => Get.toNamed('/createProject'),
            ),
            _buildListTile(
              icon: Icons.group,
              title: 'Create Team',
              onTap: () => Get.toNamed('/createTeam'),
            ),
            _buildListTile(
              icon: Icons.event,
              title: 'Create Event',
              onTap: () => Get.toNamed('/createEvent'),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16),
                ),
                child: const Icon(Icons.close, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildListTile(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    final themeData = Get.find<ThemeProvider>().themeData;
    final colorScheme = themeData.colorScheme;

    return ListTile(
      leading: Icon(icon, color: colorScheme.onSurface, size: 20),
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
