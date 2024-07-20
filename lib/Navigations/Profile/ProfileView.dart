import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Theme/ThemeProvider.dart';
import 'package:flutter_application_1/Navigations/profile/ViewProfile.dart';
import 'package:flutter_application_1/Categories/MyTask.dart';
import 'package:flutter_application_1/Categories/Settings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final colorScheme = themeProvider.themeData.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        leading:Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[50]!)),
         child:IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: colorScheme.onSurface,
          ),
        ),
        ),
        title: Text(
          'Profile',
          style: GoogleFonts.ubuntu(
            textStyle: TextStyle(
              letterSpacing: 1,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(colorScheme),
            SizedBox(height: 10),
            _buildEditButton(context, colorScheme),
            SizedBox(height: 20),
            _buildStatistics(colorScheme),
            SizedBox(height: 20),
            Expanded(child: _buildOptionsList(context, colorScheme)),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(ColorScheme colorScheme) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              'https://cdn.pixabay.com/photo/2022/06/05/13/44/girl-7244099_640.jpg',
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Jennifer Auston',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '@austonJennifer',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditButton(BuildContext context, ColorScheme colorScheme) {
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.deepPurpleAccent, width: 2),
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        ),
        child: Text(
          'View Profile',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ViewProfile()),
          );
        },
      ),
    );
  }

  Widget _buildStatistics(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatisticItem(
          icon: Icons.watch_later_outlined,
          count: '5',
          label: 'On Going',
          colorScheme: colorScheme,
        ),
        SizedBox(width: 20),
        _buildStatisticItem(
          icon: Icons.check_circle_outline,
          count: '25',
          label: 'Total Complete',
          colorScheme: colorScheme,
        ),
      ],
    );
  }

  Widget _buildStatisticItem({
    required IconData icon,
    required String count,
    required String label,
    required ColorScheme colorScheme,
  }) {
    return Expanded(
      child: Container(
        width: 80,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.deepPurpleAccent),
          borderRadius: BorderRadius.circular(8.0),
          color: colorScheme.surface,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: colorScheme.onSurface,
            ),
            Text(
              count,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),

            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionsList(BuildContext context, ColorScheme colorScheme) {
    return ListView(
      children: [
        _buildListTile(
          icon: Icons.work,
          title: 'My Projects',
          onTap: () {},
          colorScheme: colorScheme,
        ),
        _buildListTile(
          icon: Icons.group,
          title: 'Join a Team',
          onTap: () {},
          colorScheme: colorScheme,
        ),
        _buildListTile(
          icon: Icons.settings,
          title: 'Settings',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          },
          colorScheme: colorScheme,
        ),
        _buildListTile(
          icon: Icons.task,
          title: 'My Tasks',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyTask()),
            );
          },
          colorScheme: colorScheme,
        ),
      ],
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required ColorScheme colorScheme,
  }) {
    return ListTile(
      leading: Icon(icon, color: colorScheme.onSurface),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurface,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: colorScheme.onSurface),
      onTap: onTap,
    );
  }
}
