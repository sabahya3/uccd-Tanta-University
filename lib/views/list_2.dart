// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/utils/constants.dart';
import 'package:secound_version/widgets/default_container_2.dart';
import 'package:secound_version/widgets/leading_icon.dart';
import 'package:secound_version/widgets/rich_text.dart';

class List2 extends StatelessWidget {
  List2({Key? key}) : super(key: key);
  List items = [
    'Quality Control ',
    'Project Management ',
    'Health and Safety',
    'Fundamentals of Finance',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LeadingIcon(),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: defaultPading, right: defaultPading),
        child: Column(
          children: [
            TextRich(text: '(ESS)', title: 'School Of Engineering'),
            const SizedBox(
              height: defaultPading * 2,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) => DefaultContainer3(
                    image: 'assets/z6.png',
                    onPressed: () {},
                    text: items[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
