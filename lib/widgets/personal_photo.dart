// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class PersonalInfoPage extends StatelessWidget {
  PersonalInfoPage({
    Key? key,
    required this.image,
  }) : super(key: key);
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(image: DecorationImage(image: AssetImage(image))),
    );
  }
}