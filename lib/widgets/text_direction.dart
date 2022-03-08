// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextDescription extends StatelessWidget {
  TextDescription({
    Key? key,
    required this.text,
  }) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
          height: 1.7,
          fontSize: 17,
          color: Colors.black,
          fontWeight: FontWeight.bold),
    );
  }
}