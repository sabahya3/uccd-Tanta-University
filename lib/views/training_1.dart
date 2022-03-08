// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/widgets/leading_icon.dart';
import 'package:secound_version/widgets/rich_text.dart';
import 'package:secound_version/widgets/text_direction.dart';
import 'package:secound_version/widgets/txt_button.dart';

class Training1 extends StatelessWidget {
  const Training1({Key? key}) : super(key: key);

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
          child: Column(
            children: [
              TextRich(
                text: '(EST)',
                title: 'Employability Skills Training',
              ),
              const SizedBox(
                height: defaultPading * 2,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Image.asset('assets/z4.png'),
              ),
              const SizedBox(
                height: defaultPading,
              ),
              TextDescription(
                text:
                    ' برنامج يقدر ياخده الطالب مره واحده خلال اخر سنتين دراسيتين ودا بيكون  برنامج تدريبي  مكثف على مهارات التوظيف، مدتة خمس ايام متصلين ، يركز على لمهارات الي بيكتسبها الطلاب الاتصال و التخطيط و حل المشاكل و العروض التقديمية و بالاضافة لتطوير الوعي الذاتي و التحليل و الابتكار ، و من ميزات التدريب الانشطة التفاعلية و احتياجاتك و نموك الشخصي و مهاراتك. ',
              ),
              const SizedBox(
                height: defaultPading,
              ),
              DefaultButton(text: 'التسجيل في الدورة', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
