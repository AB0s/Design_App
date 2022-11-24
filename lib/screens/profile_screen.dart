import 'package:codedesign/components/cards/completed_courses_card.dart';
import 'package:codedesign/components/certificate_viewer.dart';
import 'package:codedesign/components/lists/completed_courses_list.dart';
import 'package:codedesign/constants.dart';
import 'package:codedesign/model/course.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance;
  final List<String> badges = [];
  var name = "...";
  var bio = "Loading...";
  var photoURL = FirebaseAuth.instance.currentUser.photoURL;

  void loadUserData() {
    _firestore
        .collection('users')
        .doc(_auth.currentUser.uid)
        .get()
        .then((snapshot) {
      setState(() {
        name = snapshot.data()['name'];
        bio = snapshot.data()['bio'];
      });
    });
  }

  void updateUserData() {
    _firestore.collection("users").doc(_auth.currentUser.uid).update({
      'name': name,
      'bio': bio,
    }).then((value) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Success!"),
              content: const Text("The profile data has been updated!"),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("OK!"))
              ],
            );
          });
    }).catchError((err) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Uh-Oh"),
              content: Text("$err"),
              actions: [
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Try Again!"),
                )
              ],
            );
          });
    });
  }

  void loadBadges() {
    _firestore
        .collection("users")
        .doc(_auth.currentUser.uid)
        .get()
        .then((snapshot) {
      for (var badge in snapshot.data()["badges"]) {
        _storage.ref("badges/$badge").getDownloadURL().then((url) {
          setState(() {
            badges.add(url);
          });
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadUserData();
    loadBadges();
  }
  Future getImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      print("A file was selected");
    } else {
      print("A file was not selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: kCardPopupBackgroundColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(34),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: kShadowColor,
                        offset: Offset(0, 12),
                        blurRadius: 32),
                  ]),
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 24, bottom: 32, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RawMaterialButton(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            constraints: const BoxConstraints(
                              minWidth: 40,
                              maxWidth: 40,
                              maxHeight: 24,
                            ),
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(
                                  Icons.arrow_back,
                                  color: kSecondaryLabelColor,
                                )
                              ],
                            ),
                          ),
                          Text(
                            "Profile",
                            style: kCalloutLabelStyle,
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text("Update your profile"),
                                      content: Column(
                                        children: [
                                          TextField(
                                            onChanged: (newValue) {
                                              setState(() {
                                                name = newValue;
                                              });
                                            },
                                            controller: TextEditingController(
                                                text: name),
                                          ),
                                          TextField(
                                            onChanged: (newValue) {
                                              setState(() {
                                                bio = newValue;
                                              });
                                            },
                                            controller: TextEditingController(
                                                text: bio),
                                          )
                                        ],
                                      ),
                                      actions: [
                                        FlatButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              updateUserData();
                                            },
                                            child: const Text("Updated!"))
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: kShadowColor,
                                      offset: Offset(0, 12),
                                      blurRadius: 32,
                                    )
                                  ]),
                              child: const Icon(
                                Icons.edit,
                                color: kSecondaryLabelColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              getImage();
                            },
                            child: Container(
                              height: 84,
                              width: 84,
                              decoration: BoxDecoration(
                                  gradient: const RadialGradient(
                                    colors: [
                                      Color(0xFF00AEFF),
                                      Color(0xFF0076FF),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(42)),
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: kBackgroundColor,
                                    borderRadius: BorderRadius.circular(42),
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: const Color(0xFFE7EEFB),
                                    radius: 30.0,
                                    child: (photoURL != null)
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            child: Image.network(photoURL),
                                          )
                                        : const Icon(Icons.person),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: kTitle2Style,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                bio,
                                style: kSecondaryCalloutLabelStyle,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 28, bottom: 16),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Badges",
                                  style: kHeadlineLabelStyle,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "See all",
                                      style: kSearchPlaceholderStyle,
                                    ),
                                    const Icon(
                                      Icons.chevron_right,
                                      color: kSecondaryLabelColor,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 112,
                      child: ListView.builder(
                          padding: const EdgeInsets.only(bottom: 28),
                          scrollDirection: Axis.horizontal,
                          itemCount: badges.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(
                                  left: 20, right: index != 3 ? 0 : 20),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: kShadowColor.withOpacity(0.1),
                                      offset: const Offset(0, 12),
                                      blurRadius: 18),
                                ],
                              ),
                              child: Image.network('${badges[index]}'),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 32, left: 20, right: 20, bottom: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Certificates",
                        style: kHeadlineLabelStyle,
                      ),
                      Row(
                        children: [
                          Text(
                            "See all",
                            style: kSearchPlaceholderStyle,
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: kSecondaryLabelColor,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const CertificantViewer(),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Completed Courses",
                        style: kHeadlineLabelStyle,
                      ),
                      Row(
                        children: [
                          Text(
                            "See all",
                            style: kSearchPlaceholderStyle,
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: kSecondaryLabelColor,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const CompletedCoursesList(),
            const SizedBox(
              height: 28,
            ),
          ],
        ),
      ),
    );
  }
}
