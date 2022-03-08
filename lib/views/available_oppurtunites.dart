// ignore_for_file: must_be_immutable


import 'package:flutter/material.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/utils/constants.dart';
import 'package:secound_version/widgets/default_container_2.dart';
import 'package:secound_version/widgets/leading_icon.dart';


class Detail2 extends StatelessWidget {
  Detail2({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  LeadingIcon(),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: defaultPading, right: defaultPading),
        child: Column(
          children: [
            const Text('Job Opportunities Available',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            const SizedBox(
              height: defaultPading / 2,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: jobs.length,
                  itemBuilder: (context, index) => DefaultContainer3(
                      image: 'assets/d10.png',
                      onPressed: () {},
                      text: jobs[index])),
            ),
          ],
        ),
      ),
    );
  }
}
