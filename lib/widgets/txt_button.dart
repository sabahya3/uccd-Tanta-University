// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:secound_version/utils/color_palete.dart';
class DefaultButton extends StatelessWidget {
  DefaultButton({
    Key? key,
  
    this.width = double.infinity,
    required this.text,
    required this.onPressed,
    this.iconData,
    this.sizeOfFont=18,
    this.height
  }) : super(key: key);
  String text;
  double width;
  Function onPressed;
  IconData ?iconData;
double ?sizeOfFont;
double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height==null?50:height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                secColor,
                thiColor,
              ])),
      child:iconData==null? TextButton(
          onPressed: () {
            onPressed();
          },
          child: FittedBox(
            child: Text(text,
                style:  TextStyle(
                  fontSize: sizeOfFont,
                  color: Colors.white,
                )),
          )):TextButton(
          onPressed: () {
            onPressed();
          },
          child: Row(
            children: [
  const Spacer(),
                Icon(iconData,color: Colors.white,size: 30,)
                    ,const  SizedBox(width: 30,),
              FittedBox(
                child: Text(text,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                )),
              ),
              const  Spacer(),
            ],
          ))
    );
  }
}
/*Row(mainAxisSize: MainAxisSize.min,children: [
                Spacer(),
                Icon(iconData,color: Colors.black,)
                     ,Spacer()
                ,TextButton(
          onPressed: () {
            onPressed();
          },
          child: Text(text,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              )))
                  , Spacer(),
              ],), */