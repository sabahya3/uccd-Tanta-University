import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:secound_version/models/workshops_model.dart';
import 'package:secound_version/services/db_services.dart';
import 'package:secound_version/services/dialog_service.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/utils/constants.dart';
import 'package:secound_version/widgets/custom_date_time_pikers.dart';
import 'package:secound_version/widgets/custom_txt_form_field.dart';
import 'package:secound_version/widgets/leading_icon.dart';
import 'package:secound_version/widgets/txt_1.dart';
import 'package:secound_version/widgets/txt_button.dart';

class CreateWorkShops extends StatefulWidget {
  const CreateWorkShops({Key? key}) : super(key: key);

  @override
  State<CreateWorkShops> createState() => _CreateWorkShopsState();
}

class _CreateWorkShopsState extends State<CreateWorkShops> {
  late TextEditingController title;
  late TextEditingController url;

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
    //  print(selectedDate);
  }

  @override
  void initState() {
    super.initState();
    title = TextEditingController();
    url = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    title.dispose();
    url.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);

    double h = MediaQuery.of(context).size.height;

    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: LeadingIcon(),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text1(
                text: 'انشئ ورشة جديدة',
                color: Colors.black,
                size: 21,
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Text1(
                text: 'ادخل اسم الورشة',
                color: Colors.black,
                size: 18,
              ),
              const SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DefaultFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your study level';
                      } else if (title.text.length > 1) {
                        return 'please it must be a number from 1 to 5';
                      }
                    },
                    controller: title,
                    type: TextInputType.emailAddress,
                    icon: Icons.pin_outlined),
              ),
              const SizedBox(
                height: defaultPading,
              ),
              //==========================
              Text1(
                text: 'ادخل رابط الورشة',
                color: Colors.black,
                size: 18,
              ),
              const SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DefaultFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your study level';
                      } else if (title.text.length > 1) {
                        return 'please it must be a number from 1 to 5';
                      }
                    },
                    controller: url,
                    type: TextInputType.emailAddress,
                    icon: Icons.pin_outlined),
              ),
              const SizedBox(
                height: defaultPading,
              ),
              //=======================
              Text1(
                text: 'اختار تاريخ ووقت الورشة',
                color: Colors.black,
                size: 18,
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  // SizedBox(
                  //   width: w * 0.02,
                  // ),
                  // Expanded(
                  //   child: DefaultWorkContainer(
                  //     height: h * 0.09,
                  //     width: w * 0.30,
                  //     onPressed: () {
                  //       _selectDate(context);
                  //       print(selectedDate);
                  //     },
                  //     text: DateFormat('yyyy/MM/dd ')
                  //         .format(selectedDate)
                  //         .toString(),
                  //     //h : mm a
                  //     icon: Icons.date_range,
                  //   ),
                  // ),
                  SizedBox(
                    width: w * 0.02,
                  ),
                  CustomDateTime(
                      height: h,
                      width: w,
                      iconData: Icons.date_range,
                      press: _selectDate,
                      txt: DateFormat('yyyy/MM/dd ')
                          .format(selectedDate)
                          .toString()),

                  // SizedBox(
                  //   width: w * 0.02,
                  // ),
                  SizedBox(
                    width: w * 0.02,
                  ),
                  CustomDateTime(
                      height: h,
                      width: w,
                      iconData: Icons.timer,
                      press: _selectTime,
                      txt: localizations
                          .formatTimeOfDay(selectedTime)
                          .toString()),
                  //  Expanded(
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       _selectDate(context);
                  //       print(selectedDate);
                  //     },
                  //     child: Container(
                  //       alignment: Alignment.center,
                  //       height: h * 0.09,
                  //       width: w * 0.47,
                  //       decoration: xdeco,
                  //       child: Row(
                  //         children: [
                  //           SizedBox(
                  //             width: w * 0.04,
                  //           ),
                  //           const Icon(Icons.timer,color: Colors.red,),
                  //           SizedBox(
                  //             width: w * 0.03,
                  //           ),
                  //           Text1(
                  //             text: DateFormat('yyyy/MM/dd ')
                  //                 .format(selectedDate)
                  //                 .toString(),
                  //             color: Colors.black,
                  //             size: 18,
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Expanded(
                  //   child: DefaultWorkContainer(
                  //     height: h * 0.09,
                  //     width: w * 0.47,
                  //     onPressed: () {
                  //       _selectTime(context);
                  //       print(selectedDate);
                  //     },
                  //     text: localizations
                  //         .formatTimeOfDay(selectedTime)
                  //         .toString(),
                  //     //h : mm a
                  //     icon: Icons.timer,
                  //   ),
                  // ),
                  SizedBox(
                    width: w * 0.02,
                  ),
                ],
                //
              ),
              SizedBox(
                height: h * 0.02,
              ),
              DefaultButton(
                  sizeOfFont: 21,
                  width: w * 0.95,
                  text: 'انشاء',
                  onPressed: () async {
                    final dateTime = selectedDate.applied(selectedTime);
                    String random = Random().nextDouble().toString();
                    await DbServices.instance.createModelInDb(
                        random,
                        WorkShops(
                            time: dateTime.toString(),
                            doc: random,
                            title: title.text,
                            date: selectedDate.toString(),
                            url: url.text),'workShops');
                    DialogService.instance
                        .niceSnackBar('', 'تم إنشاء ورشة العمل بنجاح', context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
