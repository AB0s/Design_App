import 'package:codedesign/constants.dart';
import 'package:codedesign/model/course.dart';
import 'package:codedesign/model/slidebar.dart';
import 'package:codedesign/screens/home_screen.dart';
import 'package:codedesign/screens/sidebar_screen.dart';
import 'package:flutter/material.dart';
import 'components/lists/explore_course_list.dart';
import 'components/lists/recent_course.dart';
import 'components/home_screen_navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:   HomeScreen(),
    );
  }
}

