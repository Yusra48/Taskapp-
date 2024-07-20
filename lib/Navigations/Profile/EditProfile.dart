import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Theme/ThemeProvider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final colorScheme = themeProvider.themeData.colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        leading: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[50]!)),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.close,
              color: colorScheme.onSurface,
            ),
          ),
        ),
        title: Text(
          'Edit Profile',
          style: GoogleFonts.ubuntu(
            textStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: TextButton(
                child: Text(
                  'Save',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Colors.deepPurpleAccent),
                ),
                onPressed: () {}),
          )
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(colorScheme),
            SizedBox(height: 10),
            Padding(padding: EdgeInsets.all(20),
            child: Column(
              children: [
             TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        prefixIcon: Icon(Icons.person_3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
             ),
             SizedBox(height: 22),
              TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
              ),
               SizedBox(height: 22),
              TextFormField(
                      decoration: InputDecoration(
                        labelText: 'UserName',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
              ),
               SizedBox(height: 22),
              TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Number',
                        prefixIcon: Icon(Icons.tty),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
              ),
          ],
        ),
      ),
       ] ),
      ),
    );
  }

  Widget _buildProfileHeader(ColorScheme colorScheme) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
              'https://cdn.pixabay.com/photo/2022/06/05/13/44/girl-7244099_640.jpg',
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 90,
                  right: 7,
                    child: CircleAvatar(
                      radius: 15,
                  backgroundColor: Colors.deepPurpleAccent,
                  child:IconButton(icon:Icon(Icons.edit,color: Colors.white,size: 15,),onPressed: (){},
                ),
                )
                ),
              ],
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
}
