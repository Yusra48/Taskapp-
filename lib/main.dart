import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Navigations/bottomsheet/CreateEventPage.dart';
import 'package:flutter_application_1/Navigations/bottomsheet/CreateTaskspage.dart';
import 'package:flutter_application_1/Navigations/bottomsheet/CreateTeamPage.dart';
import 'package:flutter_application_1/Screens/SplashScreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/Models/Theme/ThemeProvider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
   await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBoafH8kmUEvsl28Cr-V0qAASs9OGFBmHY",
            authDomain: "taskapp-64aca.firebaseapp.com",
            databaseURL: "https://taskapp-64aca-default-rtdb.firebaseio.com",
            projectId: "taskapp-64aca",
            storageBucket: "taskapp-64aca.appspot.com",
            messagingSenderId: "133424485738",
            appId: "1:133424485738:web:c7a1fbe6a7b3d2c39dc113"));
  } else {
    Firebase.initializeApp();
  }
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      theme: themeProvider.themeData,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/createTask': (context) => const CreateTaskPage(),
        // '/createProject': (context) => CreateProjectPage(),
        '/createTeam': (context) => CreateTeamPage(),
        '/createEvent': (context) => const CreateEventPage(),
      },
    );
  }
}
