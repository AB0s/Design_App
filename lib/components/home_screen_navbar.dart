import 'package:codedesign/components/searchfield_widget.dart';
import 'package:codedesign/components/sidebar_button.dart';
import 'package:codedesign/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class HomeScreenNavBar extends StatelessWidget {
  HomeScreenNavBar({@required this.triggerAnimation});
  final photoURL=FirebaseAuth.instance.currentUser.photoURL;
  final Function() triggerAnimation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SidebarButton(
            triggerAnimation: triggerAnimation,
          ),
          const SearchFieldWidget(),
          const Icon(
            Icons.notifications,
            color: kPrimaryLabelColor,
          ),
          const SizedBox(
            width: 16,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            child: CircleAvatar(
              backgroundColor: const Color(0xFFE7EEFB),
              radius: 18.0,
              child: (photoURL != null)
                  ? ClipRRect(
                borderRadius:
                BorderRadius.circular(18.0),
                child: Image.network(photoURL,
                  width: 36.0,height:36.0,fit: BoxFit.cover,),
              )
                  : const Icon(Icons.person),
            ),
          )
        ],
      ),
    );
  }
}
