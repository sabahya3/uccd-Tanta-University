// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:secound_version/models/training_model.dart';
import 'package:secound_version/models/workshops_model.dart';
import 'package:secound_version/services/db_services.dart';
import 'package:secound_version/services/dialog_service.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/widgets/leading_icon.dart';
import 'package:secound_version/widgets/txt_1.dart';
import 'package:secound_version/widgets/txt_button.dart';
import 'package:secound_version/widgets/worker.dart';

import 'package:url_launcher/url_launcher.dart';

class JoinTraining extends StatelessWidget {
  JoinTraining({Key? key, required this.training}) : super(key: key);
  Training training;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: LeadingIcon(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPading),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text1(
                text: training.title.toString(),
                color: Colors.black,
                size: 18,
              ),
              const SizedBox(
                height: defaultPading,
              ),
              Container(
                  width: width,
                  height: height * 0.30,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/z5.png')),
                  )),
              const SizedBox(
                height: defaultPading * 2,
              ),
              Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade600),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade50),
                  child: Text(
                    training.content.toString(),
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  )),
              const SizedBox(
                height: defaultPading * 2,
              ),
              DefaultButton(
                  text: 'الإنضمام للدورة',
                  onPressed: () async {
                    bool? val;
                    val = await DbServices.instance.joinModel(
                        training.doc.toString(),
                        training,
                        FirebaseAuth.instance.currentUser!.uid.toString(),
                        'trainings');
                    if (val == true) {
                      DialogService.instance
                          .niceSnackBar('', 'تم انضمامك بنجاح', context);
                    } else if (val == false) {
                      DialogService.instance
                          .niceSnackBar('', 'لقد إنضممت بالفعل ', context);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}




/*   DbServices.instance.joinModel(training.doc.toString(), training,
                FirebaseAuth.instance.currentUser!.uid.toString(),'workShops');
                DialogService.instance.niceSnackBar('', 'تم انضمامك بنجاح', context) */