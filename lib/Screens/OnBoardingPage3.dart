import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Theme/ThemeProvider.dart';
import 'package:flutter_application_1/Views/LoginView.dart';
import 'package:provider/provider.dart';

class OnBoardingPage3 extends StatefulWidget {
  const OnBoardingPage3({super.key});

  @override
  State<OnBoardingPage3> createState() => _OnBoardingPage3State();
}

class _OnBoardingPage3State extends State<OnBoardingPage3> {
  void _navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final themeData = themeProvider.themeData;

    return Scaffold(
      backgroundColor: themeData.colorScheme.surface, 
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/Circle.png',
                  width: double.infinity,
                  height: 370,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 80,
                  left: 90,
                  right: 90,
                  child: Image.asset(
                    'assets/page3.png',
                    height: 300,
                    width: 400,
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 160,
                  child: Image.asset(
                    'assets/box3.png',
                    height: 300,
                    width: 400,
                  ),
                ),
                Positioned(
                  bottom: 90,
                  left: -60,
                  child: Image.asset(
                    'assets/box4.png',
                    height: 300,
                    width: 400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Task Management',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: themeData.colorScheme.primary, 
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 100),
              child: Text(
                "Manage your tasks quickly for results",
                style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: themeData.textTheme.titleLarge?.color, 
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image.asset(
                'assets/Slider.png',
                width: 150,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: themeData.textTheme.labelLarge?.color, 
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  child: ElevatedButton(
                    onPressed: _navigateToNextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeData.colorScheme.secondary,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(15),
                      minimumSize: Size(60, 60),
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 30,
                      color: themeData.colorScheme.onSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
