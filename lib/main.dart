import 'package:codedesign/constants.dart';
import 'package:flutter/material.dart';
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
      home: Scaffold(
        body: Container(
          color: kBackgroundColor,
          child: SafeArea(
            child: Column(
              children: [
                HomeScreenNavBar(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Recents',
                        style: kLargeTitleStyle,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '23 courses more coming',
                        style: kSubtitleStyle,
                      )
                    ],
                  ),
                ),
                RecentCourseList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



