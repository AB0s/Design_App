import 'package:codedesign/screens/home_screen.dart';
import 'package:codedesign/screens/login_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        platform: TargetPlatform.iOS,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}