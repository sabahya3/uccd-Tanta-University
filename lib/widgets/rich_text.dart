// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:secound_version/utils/color_palete.dart';
class TextRich extends StatelessWidget {
  TextRich({Key? key, required this.text, required this.title})
      : super(key: key);
  String title;
  String text;

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
      TextSpan(
          text: text,
          style: TextStyle(
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ))
    ]));
  }
}