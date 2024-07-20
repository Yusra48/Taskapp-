import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Theme/ThemeProvider.dart';
import 'package:flutter_application_1/Screens/OnBoardingPage2.dart';
import 'package:provider/provider.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  void _navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OnBoardingPage2()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final themeData = themeProvider.themeData;
    final Color backgroundColor = themeData.colorScheme.surface;
    final Color primaryColor = themeData.colorScheme.primary;
    final Color onPrimaryColor = themeData.colorScheme.onPrimary;
    final Color textColor = themeData.textTheme.titleLarge?.color ?? Colors.black;

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
                  height: 350,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 120,
                  left: 120,
                  child: Image.asset(
                    'assets/Image1.png',
                    height: 300,
                  ),
                ),
                Positioned(
                  top: 100,
                  right: 160,
                  child: Image.asset(
                    'assets/Image2.png',
                    height: 200,
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 140,
                  child: Image.asset(
                    'assets/Image3.png',
                    height: 150,
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
                  color:Colors.deepPurpleAccent, 
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 100),
              child: Text(
                "Let's create a space for your Workflows",
                style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: textColor, 
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
            SizedBox(height: 5),
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
                        color:  Colors.grey, 
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  child: ElevatedButton(
                    onPressed: _navigateToNextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
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
