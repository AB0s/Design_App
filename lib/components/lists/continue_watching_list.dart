import 'package:flutter/material.dart';

import '../../model/course.dart';
import '../cards/continue_watching_card.dart';
class ContinueWatchingList extends StatefulWidget {
  const ContinueWatchingList({Key? key}) : super(key: key);

  @override
  State<ContinueWatchingList> createState() => _ContinueWatchingListState();
}

class _ContinueWatchingListState extends State<ContinueWatchingList> {
  List<Container> indicators = [];
  int currentPage = 0;
  Widget updateIndicators() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: continueWatchingCourses.map((course) {
          var index = continueWatchingCourses.indexOf(course);
          return Container(
            height: 7,
            width: 7,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentPage == index
                    ? Color(0xFF0971FE)
                    : Color(0xFFA6AEBD)),
          );
        }).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return Opacity(
                opacity: currentPage==index? 1:0.5,
                child: ContinueWatchingCard(
                  course: continueWatchingCourses[index],
                ),
              );
            },
            itemCount: continueWatchingCourses.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            controller: PageController(initialPage: 0, viewportFraction: 0.75),
          ),
        ),
        updateIndicators(),
      ],
    );
  }
}
