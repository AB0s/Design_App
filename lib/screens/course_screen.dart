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
        body: Container(
      color: kBackgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.hardEdge,
              alignment: Alignment.bottomRight,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration:
                        BoxDecoration(gradient: widget.course.background),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(18)),
                                  child: Hero(
                                    tag: widget.course.logo,
                                    child: Image.asset(
                                        'asset/logos/${widget.course.logo}'),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Hero(
                                        tag:widget.course.courseSubtitle,
                                        child: Text(
                                          widget.course.courseSubtitle,
                                          style: kSecondaryCalloutLabelStyle
                                              .copyWith(color: Colors.white70),
                                        ),
                                      ),
                                      Hero(
                                        tag: widget.course.courseTitle,
                                        child: Text(
                                          widget.course.courseTitle,
                                          style: kLargeTitleStyle.copyWith(
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: kPrimaryLabelColor
                                            .withOpacity(0.8)),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          Expanded(
                              child: Hero(
                                tag: widget.course.illustration,
                                child: Image.asset(
                                    'asset/illustrations/${widget.course.illustration}',
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
