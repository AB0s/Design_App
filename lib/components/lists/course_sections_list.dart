import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../model/course.dart';
import '../cards/course_sections_card.dart';

class CourseSectionList extends StatelessWidget {
  List<Widget> courseSectionsWidgets() {
    List<Widget> cards = [];
    for (var course in courseSections) {
      cards.add(Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: CourseSectionCard(
          course: course,
        ),
      ));
    }
    cards.add(Padding(
      padding: EdgeInsets.only(top: 12),
      child: Text(
        "No more Sections to view, look \n for more in our course",
        style: kCaptionLabelStyle,
        textAlign: TextAlign.center,
      ),
    ));
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
          children: courseSectionsWidgets(),
        ));
  }
}

