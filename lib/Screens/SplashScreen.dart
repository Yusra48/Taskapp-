import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Theme/ThemeProvider.dart';
import 'package:flutter_application_1/Screens/OnBoardingPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final themeData = themeProvider.themeData;

    return Scaffold(
      backgroundColor: themeData.colorScheme.surface, 
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 290,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/Logo.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 290,
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: ImageIcon(
                      AssetImage('assets/Layer.png'),
                      size: 40,
                      color: themeData.iconTheme.color, 
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: themeData.colorScheme.surface, 
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Image.asset('assets/Slider.png', width: 150),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Taskey',
                            style: GoogleFonts.bonaNova(
                              textStyle: TextStyle(
                                fontSize: 40,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                                color: themeData.colorScheme.primary, 
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Building Better Workplaces',
                            style: GoogleFonts.bonaNova(
                              textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                                color: themeData.textTheme.titleLarge?.color,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Create a unique emotional story that describes better than words',
                              style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.normal,
                                  color: themeData.textTheme.bodyLarge?.color, 
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 30,
                      right: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OnBoardingPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeData.colorScheme.secondary, 
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: themeData.colorScheme.onSecondary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
