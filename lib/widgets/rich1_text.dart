import 'package:flutter/material.dart';
import 'package:secound_version/utils/color_palete.dart';

class RichTexty extends StatelessWidget {
  RichTexty({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);
  String text1;
  String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPading / 2),
      child: Text.rich(
        TextSpan(
            text: text1,
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: text2,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ]),
      ),
    );
  }
}
