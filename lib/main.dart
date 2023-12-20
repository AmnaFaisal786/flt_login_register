import 'package:flt_login_register/screens/login_screen.dart';
import 'package:flt_login_register/screens/signup_screen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_auth_example/screens/login_screen.dart';
// import 'package:flutter_auth_example/screens/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/signup',
      routes: {
        '/signup': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),
        '/logout': (context) => LogoutScreen(),
      },
    );
  }
}

class LogoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Add logout logic here
            Navigator.pushReplacementNamed(context, '/login');
          },
          child: Text('Sign Out'),
        ),
      ),
    );
  }
}
