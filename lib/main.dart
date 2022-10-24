import 'package:codedesign/constants.dart';
import 'package:codedesign/model/course.dart';
import 'package:codedesign/model/slidebar.dart';
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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late Animation<Offset> sidebarAnimation;
  late AnimationController sidebarAnimationController;

  @override
  void initState() {
    super.initState();
    sidebarAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    sidebarAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
        parent: sidebarAnimationController, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  HomeScreenNavBar(triggerAnimation: (){
                    sidebarAnimationController.forward();
                  },),
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
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 25, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Explore",
                          style: kTitle1Style,
                        )
                      ],
                    ),
                  ),
                  ExploreCourseList(),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  color: Color.fromRGBO(36, 38, 41, 0.4),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
                SlideTransition(
                position: sidebarAnimation,
                child: SafeArea(
                  child: SidebarScreen(),
                  bottom: false,
                ),
              ),],
            ),
          ],
        ),
      ),
    );
  }
}
