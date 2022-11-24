import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../model/course.dart';


class ExploreCourseCard extends StatefulWidget {
  ExploreCourseCard({@required this.course});
  final Course course;

  @override
  State<ExploreCourseCard> createState() => _ExploreCourseCardState();
}

class _ExploreCourseCardState extends State<ExploreCourseCard> {
  final _storage=FirebaseStorage.instance;
  String illustrationURL;
  @override
  void initState() {
    super.initState();
    getIllustration();
  }
  void getIllustration(){
    _storage
        .ref("illustrations/${widget.course.illustration}")
        .getDownloadURL()
        .then((url) {
      setState(() {
        illustrationURL = url;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(41.0),
        child: Container(
          height: 120,
          width: 280,
          decoration: BoxDecoration(
            gradient: widget.course.background,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.course.courseSubtitle,
                          style: kCardSubtitleStyle,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          widget.course.courseTitle,
                          style: kCardTitleStyle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    (illustrationURL == null)
                        ? Container()
                        : Image.network(
                      illustrationURL,
                      fit: BoxFit.cover,
                      height: 100.0,
                    )
                  ],

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
