import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../components/cards/course_sections_card.dart';
import '../components/lists/course_sections_list.dart';
import '../constants.dart';
import '../model/course.dart';
import 'course_sections_screen.dart';

class CourseScreen extends StatefulWidget {
  CourseScreen({required this.course});
  final Course course;

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  Widget indicators() {
    List<Widget> indicators = [];
    for (var i = 0; i < 9; i++) {
      indicators.add(Container(
        width: 7,
        height: 7,
        margin: EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: i == 0 ? Color(0xFF0971FE) : Color(0XFFA6AEBD),
        ),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }

  late PanelController panelController;
  @override
  void initState() {
    super.initState();
    panelController = PanelController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: kBackgroundColor,
      child: SlidingUpPanel(
        controller: panelController,
        backdropEnabled: true,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(34)),
        color: kCardPopupBackgroundColor,
        boxShadow: const [
          BoxShadow(
            color: kShadowColor,
            offset: Offset(0, -12),
            blurRadius: 32,
          )
        ],
        minHeight: 0,
        maxHeight: MediaQuery.of(context).size.height * 0.95,
        panel: CourseSectionsScreen(),
        body: SingleChildScrollView(
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
                                        borderRadius:
                                            BorderRadius.circular(18)),
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
                                          tag: widget.course.courseSubtitle,
                                          child: Text(
                                            widget.course.courseSubtitle,
                                            style: kSecondaryCalloutLabelStyle
                                                .copyWith(
                                                    color: Colors.white70),
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
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: kPrimaryLabelColor
                                              .withOpacity(0.8)),
                                      child: const Icon(
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
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 28),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 12.5, bottom: 13.5, left: 20.5, right: 14.5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(blurRadius: 16, offset: Offset(0, 4))
                          ]),
                      width: 60,
                      height: 60,
                      child: Image.asset('asset/icons/icon-play.png'),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 12,
                  left: 28,
                  right: 28,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 58,
                          width: 58,
                          decoration: BoxDecoration(
                            gradient: widget.course.background,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(4),
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: kBackgroundColor,
                                borderRadius: BorderRadius.circular(29),
                              ),
                              child: const CircleAvatar(
                                radius: 21,
                                backgroundColor: kCourseElementIconColor,
                                child: Icon(
                                  Icons.people,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "28.7k",
                              style: kTitle1Style,
                            ),
                            Text(
                              "Students",
                              style: kSearchPlaceholderStyle,
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 58,
                          width: 58,
                          decoration: BoxDecoration(
                            gradient: widget.course.background,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(4),
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: kBackgroundColor,
                                borderRadius: BorderRadius.circular(29),
                              ),
                              child: const CircleAvatar(
                                radius: 21,
                                backgroundColor: kCourseElementIconColor,
                                child: Icon(
                                  Icons.format_quote,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "12.4k",
                              style: kTitle1Style,
                            ),
                            Text(
                              "Comments",
                              style: kSearchPlaceholderStyle,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28, vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    indicators(),
                    GestureDetector(
                      onTap: () {
                        panelController.open();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: kShadowColor,
                                  offset: Offset(0, 12),
                                  blurRadius: 16)
                            ],
                            borderRadius: BorderRadius.circular(14)),
                        width: 80,
                        height: 40,
                        child: Text(
                          "View all",
                          style: kSearchTextStyle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "5 years ago, I couldn’t write a single line of Swift. I learned it and moved to React, Flutter while using increasingly complex design tools. I don’t regret learning them because SwiftUI takes all of their best concepts. It is hands-down the best way for designers to take a first step into code.",
                      style: kBodyLabelStyle,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "About this course",
                      style: kTitle1Style,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "This course was written for people who are passionate about design and about Apple's SwiftUI. It beginner-friendly, but it is also packed with tricks and cool workflows about building the best UI. Currently, Xcode 11 is still in beta so the installation process may be a little hard. However, once you get everything working, then it'll get much friendlier!",
                      style: kBodyLabelStyle,
                    ),
                    const SizedBox(height: 24.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

