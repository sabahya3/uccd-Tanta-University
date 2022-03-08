// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:secound_version/models/training_model.dart';
import 'package:secound_version/services/db_services.dart';
import 'package:secound_version/services/dialog_service.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/views/mohakat_almokablah.dart';
import 'package:secound_version/widgets/custom_txt_form_field.dart';
import 'package:secound_version/widgets/leading_icon.dart';
import 'package:secound_version/widgets/txt_1.dart';
import 'package:secound_version/widgets/txt_button.dart';

class CreateTraining extends StatefulWidget {
  CreateTraining({Key? key}) : super(key: key);

  @override
  State<CreateTraining> createState() => _CreateTrainingState();
}

class _CreateTrainingState extends State<CreateTraining> {
  late TextEditingController title;

  late TextEditingController des;

  late TextEditingController sponsor;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    title = TextEditingController();
    des = TextEditingController();
      sponsor = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    title.dispose();
    des.dispose();
    sponsor.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: LeadingIcon(),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: defaultPading, right: defaultPading),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultPhoto(
                  image: 'assets/f6.png',
                  height: height * 0.20,
                ),
                const SizedBox(
                  height: defaultPading,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text1(
                      text: 'ادخل عنوان الدورة',
                      size: 18,
                      color: Colors.black,
                    )),
                SizedBox(
                  height: height * 0.02,
                ),
                DefaultFormField(
                    controller: title,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'من فضلك ادخل عنوان للدورة';
                      }
                    },
                    type: TextInputType.name,
                    icon: Icons.science),
                const SizedBox(
                  height: defaultPading,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text1(
                      text: 'ادخل اسم الجهة',
                      size: 18,
                      color: Colors.black,
                    )),
                SizedBox(
                  height: height * 0.02,
                ),
                DefaultFormField(
                    controller: sponsor,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'من فضلك ادخل اسم الجهة';
                      }
                    },
                    type: TextInputType.name,
                    icon: Icons.work),
                const SizedBox(
                  height: defaultPading,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text1(
                      text: 'ادخل محتوي الدورة',
                      size: 18,
                      color: Colors.black,
                    )),
                const SizedBox(
                  height: 7,
                ),
                DefaultFormField(
                    maxLine: 4,
                    controller: des,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'من فضلك ادخل محتوي الدورة';
                      }
                    },
                    type: TextInputType.multiline,
                    icon: Icons.content_paste),
                SizedBox(
                  height: height * 0.03,
                ),
                DefaultButton(
                    text: 'إنشاء',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        String random = Random().nextDouble().toString();

                        DbServices.instance.createModelInDb(
                            random,
                            Training(
                              sponsor: sponsor.text,
                                doc: random,
                                date: DateTime.now().toString(),
                                content: des.text,
                                title: title.text),'trainings');
                        DialogService(bgColor: Colors.pink.withOpacity(0.6))
                            .niceSnackBar(
                                '', 'تم أنشاء الدورة بنجاح ', context);
                        title.clear();
                        des.clear();
                        sponsor.clear();
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}