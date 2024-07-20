import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                _buildListTile(
                  icon: CupertinoIcons.create,
                  title: 'Create Task',
                  onTap: () => Navigator.pushNamed(context, '/createTask'),
                ),
                _buildListTile(
                  icon: CupertinoIcons.folder,
                  title: 'Create Project',
                  onTap: () => Navigator.pushNamed(context, '/createProject'),
                ),
                _buildListTile(
                  icon: CupertinoIcons.group,
                  title: 'Create Team',
                  onTap: () => Navigator.pushNamed(context, '/createTeam'),
                ),
                _buildListTile(
                  icon: CupertinoIcons.pano_fill,
                  title: 'Create Event',
                  onTap: () => Navigator.pushNamed(context, '/createEvent'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
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
    );
  }

  ListTile _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
        size: 24,
      ),
      title: Text(
        title,
        style: GoogleFonts.ubuntu(
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
