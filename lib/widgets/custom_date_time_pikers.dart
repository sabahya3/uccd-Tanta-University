import 'package:flutter/material.dart';
import 'package:secound_version/utils/constants.dart';
import 'package:secound_version/widgets/txt_1.dart';

class CustomDateTime extends StatelessWidget {
  CustomDateTime(
      {Key? key,
      required this.height,
      required this.width,
      required this.iconData,
      required this.press,
      required this.txt})
      : super(key: key);

  Function press;
  double width;
  double height;
  String txt;
  IconData iconData;
  @override
  Widget build(BuildContext context) {
    return   Expanded(
                    child: GestureDetector(
                      onTap: () {
                      press(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: height * 0.09,
                        width: width * 0.47,
                        decoration: xdeco,
                        child: Row(
                          children: [
                            SizedBox(
                              width: height * 0.04,
                            ),
                             Icon(iconData,color: Colors.red,),
                            SizedBox(
                              width: width * 0.03,
                            ),
                            Text1(
                              text: txt,
                              color: Colors.black,
                              size: 18,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
  }
}
