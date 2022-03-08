// ignore_for_file: must_be_immutable


import 'package:flutter/material.dart';
import 'package:secound_version/widgets/leading_icon.dart';
import 'package:secound_version/widgets/personal_photo.dart';


class RamiPage extends StatelessWidget {
  const RamiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LeadingIcon(),
      ),
      body: PersonalInfoPage(
        image: 'assets/p1.jpeg',
      ),
    );
  }
}
