import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Theme/ThemeProvider.dart';
import 'package:flutter_application_1/Navigations/Profile/EditProfile.dart';
import 'package:provider/provider.dart';

class ViewProfile extends StatelessWidget {
  const ViewProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final colorScheme = themeProvider.themeData.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: _buildAppBar(context, colorScheme),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(colorScheme),
            const SizedBox(height: 10),
            _buildEditButton(context, colorScheme),
            const SizedBox(height: 10),
            _buildWorkspaceSection(colorScheme),
            const SizedBox(height: 8),
            _buildManageSection(colorScheme),
            const SizedBox(height: 2),
            _buildManageRow(colorScheme),
            const SizedBox(height: 20),
            _buildLogoutButton(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, ColorScheme colorScheme) {
    return AppBar(
      backgroundColor: colorScheme.surface,
      leading: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[50]!)),
     child:  IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.close,
          color: colorScheme.onSurface,
        ),
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
          const SizedBox(height: 10),
          Text(
            'Jennifer Auston',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '@austonJennifer',
            style: TextStyle(
              color: colorScheme.onSurface.withOpacity(0.6),
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
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        ),
        child: Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EditProfile()),
          );
        },
      ),
    );
  }

  Widget _buildWorkspaceSection(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'WorkSpace',
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Padding(padding: EdgeInsets.only(left: 10,right: 10),
       child:  Container(
          height: 50,
          decoration: BoxDecoration(
            color: colorScheme.background,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: colorScheme.primary),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'UI Design',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: colorScheme.onSurface,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.deepPurpleAccent, width: 2),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  ),
                  child: Text(
                    'Invite',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        ),
      ],
    );
  }

  Widget _buildManageSection(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Manage',
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildManageItem('Team', '8', colorScheme),
            _buildManageItem('Labels', '13', colorScheme),
          ],
        ),
      ],
    );
  }

  Widget _buildManageRow(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildManageItem('Task', '8', colorScheme),
        _buildManageItem('Member', '13', colorScheme),
      ],
    );
  }

  Widget _buildManageItem(String title, String count, ColorScheme colorScheme) {
    return  Padding(padding: EdgeInsets.only(left: 10,right: 20),
   child:  Container(
      height: 50,
      width: 200,
      decoration: BoxDecoration(
        color: colorScheme.background,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colorScheme.primary),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: colorScheme.onSurface,
              ),
            ),
            TextButton(
              style:TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.deepPurpleAccent, width: 2),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
                  ), 
                  onPressed: (){},
              child: Text(
              count,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            )
            ),
          ],
        ),
      ),
   ),
    );
  }

  Widget _buildLogoutButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xAE7A3AE0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 170),
        ),
        child: const Text(
          'Log Out',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
