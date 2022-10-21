import 'package:flutter/material.dart';
import 'package:codedesign/constants.dart';

import '../components/sidebar_row.dart';
import '../model/slidebar.dart';


class SidebarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
      decoration: const BoxDecoration(
        color: kSidebarBackgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(34),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('asset/images/profile.jpg'),
                  radius: 21,
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Text(
                      "Abo Sh",
                      style: kHeadlineLabelStyle,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Licence ends on 21, Jan 2023",
                      style: kSearchPlaceholderStyle,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            SidebarRow(
              item: sidebarItem[0],
            ),
            const SizedBox(
              height: 32,
            ),
            SidebarRow(
              item: sidebarItem[1],
            ),
            const SizedBox(
              height: 32,
            ),
            SidebarRow(
              item: sidebarItem[2],
            ),
            const SizedBox(
              height: 32,
            ),
            SidebarRow(
              item: sidebarItem[3],
            ),
            const SizedBox(
              height: 32,
            ),
            const Spacer(),
            Row(
              children: [
                Image.asset(
                  'asset/icons/icon-logout.png',
                  width: 17,
                ),
                const SizedBox(width: 12,),
                Text("Log Out", style: kSecondaryCalloutLabelStyle,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
