// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/utils/constants.dart';


class DefaultContainer3 extends StatelessWidget {
  DefaultContainer3({
    Key? key,
    required this.image,
    required this.onPressed,
    required this.text,
    this.height = 55,
    this.size = 14,
  }) : super(key: key);
  String image;
  String text;
  Function onPressed;
  double height;
  double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom:10,left: 20,right: 20),
        padding: const EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width,
        height: height,
        decoration: xdeco,
        child: Row(
          //  mainAxisAlignment: ,
          children: [
            Image.asset(
              image,
              height: 50,
              fit: BoxFit.cover,
            ),
            const Spacer(),
            Text(text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: size,
                )),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
