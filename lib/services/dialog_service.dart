import 'package:flutter/material.dart';

class DialogService {
  static DialogService instance = DialogService();
  Color? bgColor;
DialogService({this.bgColor});

  niceSnackBar(String title, String content, BuildContext ctx) {
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
      margin:const EdgeInsets.all(18),
      duration: const Duration(milliseconds: 1500),
      elevation: 10,
        behavior: SnackBarBehavior.floating,
        backgroundColor:bgColor==null? Colors.blue.withOpacity(0.4):bgColor,

      // margin: const EdgeInsets.all(10),
      content: Container(
        height: 40,
        width: MediaQuery.of(ctx).size.width*0.80,
        alignment: Alignment.center,
     
        child: Text(
        content,
        style:const TextStyle(fontSize: 17, color: Colors.white,fontWeight: FontWeight.bold),
      ),
      ),
      action: SnackBarAction(
        textColor: Colors.black,
        label: title,
        onPressed: () {},
      ),
    ));
  }
}
