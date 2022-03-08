// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:secound_version/utils/color_palete.dart';

import 'package:secound_version/widgets/custom_txt_form_field.dart';
import 'package:secound_version/widgets/leading_icon.dart';
import 'package:secound_version/widgets/txt_1.dart';
import 'package:secound_version/widgets/txt_button.dart';
class Data1 extends StatelessWidget {
  Data1({Key? key}) : super(key: key);
  var id = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LeadingIcon(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPading),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultPhoto(image: 'assets/f6.png'),
                const SizedBox(
                  height: defaultPading * 3,
                ),
                Text1(text: 'Enter Your ID'),
                const SizedBox(
                  height: defaultPading / 2,
                ),
                DefaultFormField(
                    controller: id,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter the id';
                      }
                    },
                    type: TextInputType.phone,
                    icon: Icons.pin_rounded),
                const SizedBox(
                  height: defaultPading,
                ),
                DefaultButton(
                    text: 'Save',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DefaultPhoto extends StatelessWidget {
  DefaultPhoto({
    Key? key,
    this.width,
    this.height,
    required this.image,
  }) : super(key: key);
  String image;
double ?width;
double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
        width:width ?? MediaQuery.of(context).size.width,
        height:height ?? MediaQuery.of(context).size.height * 0.40,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image)),
        ));
  }
}
