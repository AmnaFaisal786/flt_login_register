// login_screen.dart
import 'package:flutter/material.dart';
import 'package:flt_login_register/db_helper.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // Use ListView to allow scrolling if the content overflows
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () async {
                    String email = emailController.text;
                    String password = passwordController.text;

                    Map<String, dynamic>? user =
                    await DBHelper().getUserByEmail(email);

                    if (user != null && user['password'] == password) {
                      Navigator.pushReplacementNamed(context, '/logout');
                    } else {
                      // Handle invalid login
                      print('Invalid login credentials');
                    }
                  },
                  child: Text('Login'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/signup');
                },
                child: Text(
                  'Don\'t have an account? Sign up',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
