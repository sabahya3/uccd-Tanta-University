// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:secound_version/widgets/leading_icon.dart';
import 'package:secound_version/widgets/personal_photo.dart';


class AhmedPage extends StatelessWidget {
  const AhmedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LeadingIcon(),
      ),
      body: PersonalInfoPage(
        image: 'assets/p2.jpeg',
      ),
    );
  }
}
