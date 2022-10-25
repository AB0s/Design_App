import 'package:flutter/material.dart';
import '../constants.dart';
import '../model/course.dart';
class CourseScreen extends StatefulWidget {
  CourseScreen({required this.course});
  final Course course;

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            color: kBackgroundColor,
            child: Center(
              child: Text(widget.course.courseTitle),
            ),
          ),
        ));
  }
}
