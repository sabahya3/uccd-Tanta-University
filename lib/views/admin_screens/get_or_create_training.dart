import 'package:flutter/material.dart';
import 'package:secound_version/services/navigation_services.dart';
import 'package:secound_version/views/admin_screens/available_trainings.dart';
import 'package:secound_version/views/admin_screens/create_training.dart';

import 'package:secound_version/widgets/custom_view.dart';
import 'package:secound_version/widgets/leading_icon.dart';

class CreateOrGetTraining extends StatelessWidget {
  const CreateOrGetTraining({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: LeadingIcon(),
        ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/a2.png',
              width: w * 0.75,
              height: height * 0.30,
            ),
            CustomView(
                onTap: () {
                  NavigationService.instance.goTO(context, CreateTraining());
                },
                txt: 'إنشاء دورة تدريبية جديدة'),
            SizedBox(
              height: height * 0.03,
            ),
            CustomView(
                onTap: () {
                  NavigationService.instance
                      .goTO(context, const AvialableTrainings());
                },
                txt: 'الدورات المتاحة حاليا'),
          ],
        ),
      ),
    );
  }
}
