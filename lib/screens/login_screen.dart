import 'package:codedesign/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kSidebarBackgroundColor,
        child: ListView(
          children: [
            Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      transform: Matrix4.translationValues(0, -75, 0),
                      child: Image.asset(
                          'asset/illustrations/illustration-14.png'),
                    ),
                    Container(
                      transform: Matrix4.translationValues(0, -170, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Learn to design\nand code apps",
                            style:
                                kLargeTitleStyle.copyWith(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 7.0,
                          ),
                          Text(
                            "Completed courses about the best\ntools and design systems",
                            style: kHeadlineLabelStyle.copyWith(
                                color: Colors.white70),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  transform: Matrix4.translationValues(0, -150, 0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 53.0),
                    child: Column(
                      children: [
                        Text(
                          "Log in to",
                          style: kTitle1Style,
                        ),
                        Text(
                          "Start Learning",
                          style: kTitle1Style.apply(color: Color(0xFF5B4CF0)),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          height: 130,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: kShadowColor,
                                      offset: Offset(0, 12),
                                      blurRadius: 16,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 5, right: 16, left: 16),
                                      child: TextField(
                                        cursorColor: kPrimaryLabelColor,
                                        decoration: InputDecoration(
                                          icon: const Icon(
                                            Icons.email,
                                            color: Color(0xFF5488F1),
                                            size: 20,
                                          ),
                                          border: InputBorder.none,
                                          hintText: "Email Adress",
                                          hintStyle: kLoginInputTextStyle,
                                        ),
                                        style: kLoginInputTextStyle.copyWith(
                                            color: Colors.black),
                                      ),
                                    ),
                                    const Divider(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 5, right: 16, left: 16),
                                      child: TextField(
                                        cursorColor: kPrimaryLabelColor,
                                        decoration: InputDecoration(
                                          icon: const Icon(
                                            Icons.password,
                                            color: Color(0xFF5488F1),
                                            size: 20,
                                          ),
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle: kLoginInputTextStyle,
                                        ),
                                        style: kLoginInputTextStyle.copyWith(
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF73A0F4),
                                          Color(0xFF4A47F5),
                                        ],
                                      ),
                                    ),
                                    height: 47,
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      "Login",
                                      style: kCalloutLabelStyle.copyWith(
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
