import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/HomeView.dart';
import 'package:flutter_application_1/Models/Theme/ThemeProvider.dart';
import 'package:flutter_application_1/Views/LoginView.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final themeData = themeProvider.themeData;

    return Scaffold(
      backgroundColor: themeData.colorScheme.surface,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_rounded,
            color: themeData.iconTheme.color, size: 40),
        title: Text(
          'Sign Up',
          style: TextStyle(
            letterSpacing: 1.5,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: themeData.colorScheme.onSurface,
          ),
        ),
        centerTitle: true,
        backgroundColor: themeData.colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create an account',
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
                'Please enter your information to create an account',
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
            SizedBox(height: 10),
            _buildTextField(
              controller: _passwordConfirmController,
              hintText: 'Confirm Your Password',
              isObscure: true,
            ),
            SizedBox(height: 20),
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
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeData.colorScheme.secondary,
                  shadowColor: Colors.grey[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _signUp,
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: themeData.colorScheme.onSecondary,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Sign up with',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: themeData.textTheme.bodyLarge?.color,
                ),
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/Google.png', height: 40),
                SizedBox(width: 20),
                Image.asset('assets/Apple.png', height: 40),
              ],
            ),
            SizedBox(height: 5),
            Center(
              child: TextButton(
                child: Text(
                  'Already have an account? Sign In',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: themeData.primaryColor,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                },
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

  Future<void> _signUp() async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();
    final String passwordConfirm = _passwordConfirmController.text.trim();

    if (email.isEmpty || password.isEmpty || passwordConfirm.isEmpty) {
      setState(() {
        _errorMessage = 'Please fill out all fields.';
      });
      return;
    }

    if (password != passwordConfirm) {
      setState(() {
        _errorMessage = 'Passwords do not match.';
      });
      return;
    }

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      );
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to sign up. Please try again.';
      });
    }
  }
}
