// ignore_for_file: must_be_immutable


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:secound_version/models/workshops_model.dart';
import 'package:secound_version/services/db_services.dart';
import 'package:secound_version/services/dialog_service.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/widgets/leading_icon.dart';
import 'package:secound_version/widgets/worker.dart';

import 'package:url_launcher/url_launcher.dart';

class Work1 extends StatelessWidget {
  Work1({Key? key, required this.workShop}) : super(key: key);
  WorkShops workShop;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: LeadingIcon()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPading),
        child: Worker(
          isStudent: true,
          join: () async {
            DbServices.instance.joinModel(workShop.doc.toString(), workShop,
                FirebaseAuth.instance.currentUser!.uid.toString(),'workShops');
                DialogService.instance.niceSnackBar('', 'تم انضمامك بنجاح', context);
          },
          date: DateFormat('yyyy-MM-dd – h:mm a')
              .format(DateTime.parse(workShop.date.toString()))
              .toString(),
          onPressed: () async {
            var url = workShop.url.toString();
            if (await canLaunch(url)) {
              await launch(url);
            }
          },
        ),
      ),
    );
  }
}
