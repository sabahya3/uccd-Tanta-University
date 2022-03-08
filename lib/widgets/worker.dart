// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/views/mohakat_almokablah.dart';
import 'package:secound_version/widgets/default_worker_container.dart';
import 'package:secound_version/widgets/txt_button.dart';
class Worker extends StatelessWidget {
  Worker({
    Key? key,
    required this.onPressed,
    required this.date,
   this. isStudent=false,
    this.join

  }) : super(key: key);

  Function onPressed;
  String date;
 bool? isStudent;
 Function ?join;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultPhoto(image: 'assets/z2.png'),
        const SizedBox(
          height: defaultPading * 2,
        ),
        DefaultWorkContainer(
            text: 'الذهاب لورشة العمل',
            icon: Icons.people_outline_outlined,
            onPressed: () {
              onPressed();
            }),
        const SizedBox(
          height: defaultPading,
        ),
        DefaultWorkContainer(
            text:date,
            icon: Icons.date_range_outlined,
            onPressed: () {}),
           const SizedBox(height: 20,),

SizedBox(child:isStudent==true? DefaultButton(text: 'الانضمام للورشة', onPressed: (){
  join!();
}):null,)

      ],
    );
  }
}
