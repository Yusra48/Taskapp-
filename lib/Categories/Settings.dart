import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Theme/ThemeProvider.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool permission = true;
  bool pushNotification = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final themeData = themeProvider.themeData;

    bool isDarkMode = themeData.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: themeData.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: themeData.colorScheme.primary,
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: themeData.colorScheme.onPrimary),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: themeData.colorScheme.onPrimary,
            ),
          ),
        ),
        title: Center(
          child: Text(
            'Settings',
            style: GoogleFonts.ubuntu(
              textStyle: themeData.textTheme.titleLarge!.copyWith(
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SwitchListTile(
              title: Text(
                'Permission',
                style: themeData.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              value: permission,
              onChanged: (bool value) {
                setState(() {
                  permission = value;
                });
              },
            ),
            SwitchListTile(
              title: Text(
                'Push Notification',
                style: themeData.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              value: pushNotification,
              onChanged: (bool value) {
                setState(() {
                  pushNotification = value;
                });
              },
            ),
            SwitchListTile(
              title: Text(
                'Dark Mode',
                style: themeData.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              value: isDarkMode,
              onChanged: (bool value) {
                themeProvider.toggleTheme();
              },
            ),
            ListTile(
              title: Text(
                'Security',
                style: themeData.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: themeData.iconTheme.color),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Help',
                style: themeData.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: themeData.iconTheme.color),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Language',
                style: themeData.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: themeData.iconTheme.color),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'About Application',
                style: themeData.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: themeData.iconTheme.color),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
