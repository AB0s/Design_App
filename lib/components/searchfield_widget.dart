import 'package:flutter/material.dart';
import 'package:codedesign/constants.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: 12, right: 33),
          child: Container(
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                cursorColor: kPrimaryLabelColor,
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.search,
                    color: kPrimaryLabelColor,
                  ),
                  border: InputBorder.none,
                  hintText: "Search for courses",
                  hintStyle: kSearchPlaceholderStyle,
                ),
                style: kSearchTextStyle,
                onChanged: (newText) {
                  print(newText);
                },
              ),
            ),
          ),
        ));
  }
}
