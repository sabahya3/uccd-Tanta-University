// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:secound_version/utils/color_palete.dart';

class DefaultContainerNetwork extends StatelessWidget {
  DefaultContainerNetwork({
    Key? key,
    required this.image,
    required this.text,
    required this.onPress,
  }) : super(key: key);
  String image;
  String text;
  Function onPress;

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
        double width=MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        margin:const  EdgeInsets.all(15),
        padding: const EdgeInsets.all(10),
        width: width * 0.50,
        height:height* 0.27,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Image.asset(
              image,
              height: height*0.15,
            ),
      const  Spacer(),
            FittedBox(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: thiColor),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
