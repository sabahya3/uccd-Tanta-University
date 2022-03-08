// ignore_for_file: must_be_immutable


import 'package:flutter/material.dart';
import 'package:secound_version/services/navigation_services.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/utils/constants.dart';
import 'package:secound_version/widgets/txt_1.dart';

class DefaultWorkContainer extends StatelessWidget {
  DefaultWorkContainer({
    Key? key,

     this.remove,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.width,
    this.height,
    this.isTraillinng=false,
    this.date
    
    
  }) : super(key: key);
  String text;
  IconData icon;
  Function onPressed;
  double? width;
  double? height;
  Function ?remove;
  bool ?isTraillinng;
  String ? date;


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: defaultPading),
        width: width == null ? w : width,
        height: height == null ? 55 : height,
        decoration: xdeco,
        child: Row(
          children: [
             SizedBox(
              width: w * 0.04,
            ),
          Icon(icon, color: Colors.redAccent),
            SizedBox(
              width: w * 0.02,
            ),
            FittedBox(
              child: Text1(text: text,color: Colors.black,size: 18,
                  ),
            ),
           SizedBox(
              width: w * 0.02,
            ),
           
          ],
        ),
      ),
    );
  }
}
