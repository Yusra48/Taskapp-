import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Theme/ThemeProvider.dart';
import 'package:flutter_application_1/Screens/OnBoardingPage3.dart';
import 'package:provider/provider.dart';

class OnBoardingPage2 extends StatefulWidget {
  const OnBoardingPage2({super.key});

  @override
  State<OnBoardingPage2> createState() => _OnBoardingPage2State();
}

class _OnBoardingPage2State extends State<OnBoardingPage2> {
  void _navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OnBoardingPage3()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final themeData = themeProvider.themeData;
    final Color backgroundColor = themeData.colorScheme.surface;
    final Color primaryColor = themeData.colorScheme.primary;
    final Color onPrimaryColor = themeData.colorScheme.onPrimary;

    return Scaffold(
      backgroundColor: backgroundColor,
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
                  top: 90,
                  left: 90,
                  right: 90,
                  child: Image.asset(
                    'assets/page2.png',
                    height: 300,
                    width: 400,
                  ),
                ),
                Positioned(
                  top: -20,
                  left: -30,
                  child: Image.asset(
                    'assets/box1.png',
                    height: 290,
                    width: 300,
                  ),
                ),
                Positioned(
                  top: 50,
                  right: -60,
                  child: Image.asset(
                    'assets/box2.png',
                    height: 290,
                    width: 300,
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
                  color: primaryColor, 
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 100),
              child: Text(
                "Work more structured and organized",
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
                      backgroundColor: primaryColor, 
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(15),
                      minimumSize: Size(60, 60),
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 30,
                      color: onPrimaryColor, 
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
