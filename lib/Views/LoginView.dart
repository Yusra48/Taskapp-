import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/HomeView.dart';
import 'package:flutter_application_1/Models/Theme/ThemeProvider.dart';
import 'package:flutter_application_1/Views/SignUpView.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final themeData = themeProvider.themeData;

    return Scaffold(
      backgroundColor: themeData.colorScheme.surface,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_rounded, color: themeData.iconTheme.color, size: 40),
        title: Text(
          'Sign In',
          style: themeData.appBarTheme.titleTextStyle,
        ),
        centerTitle: true,
        backgroundColor: themeData.appBarTheme.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back',
              style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                  fontSize: 30,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  color: themeData.textTheme.displayLarge?.color,
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 100),
              child: Text(
                'Please enter your email address and password to log in',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: themeData.textTheme.bodyLarge?.color,
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildTextField(
              controller: _emailController,
              hintText: 'Enter Your Email address',
              isObscure: false,
            ),
            SizedBox(height: 20),
            _buildTextField(
              controller: _passwordController,
              hintText: 'Enter Your Password',
              isObscure: true,
            ),
            SizedBox(height: 5),
            if (_errorMessage != null) 
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  _errorMessage!,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: themeData.textTheme.labelLarge?.color,
                  ),
                ),
              ),
            ),
            SizedBox(height: 35),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeData.colorScheme.secondary,
                  shadowColor: themeData.shadowColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _signIn,
                child: Text(
                  'Sign In',
                  style: themeData.textTheme.labelLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Sign in with',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: themeData.textTheme.bodyLarge?.color,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/Google.png', height: 40),
                SizedBox(width: 20),
                Image.asset('assets/Apple.png', height: 40),
              ],
            ),
            SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpView()),
                  );
                },
                child: Text(
                  'Not Registered Yet? Sign Up',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: themeData.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required bool isObscure,
  }) {
    final themeData = Theme.of(context);

    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: themeData.hintColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Future<void> _signIn() async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter both email and password.';
      });
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      );
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to sign in. Please check your credentials and try again.';
      });
    }
  }
}
