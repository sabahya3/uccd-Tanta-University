// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:secound_version/utils/color_palete.dart';

class PersonalInfo extends StatelessWidget {
  PersonalInfo({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  String text;
  Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: defaultPading),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  secColor,
                  thiColor,
                ])),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.personal_injury_outlined,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: defaultPading / 2,
                ),
                Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                ),
              ],
            )),
      ),
    );
  }
}
