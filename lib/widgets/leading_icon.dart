// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class LeadingIcon extends StatelessWidget {
  LeadingIcon({
    Key? key,
    this.iconData = Icons.arrow_back_ios,
    this.color = Colors.black,
  }) : super(key: key);
  IconData iconData;
  Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          iconData,
          color: color,
        ));
  }
}
