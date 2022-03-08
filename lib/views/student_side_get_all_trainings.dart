import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:secound_version/models/training_model.dart';
import 'package:secound_version/services/db_services.dart';
import 'package:secound_version/services/navigation_services.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/views/admin_screens/work_shop_students.dart';
import 'package:secound_version/views/mohakat_almokablah.dart';
import 'package:secound_version/views/studet_side_join_training.dart';
import 'package:secound_version/widgets/default_container_2.dart';

import 'package:secound_version/widgets/leading_icon.dart';
import 'package:secound_version/widgets/rich_text.dart';
import 'package:secound_version/widgets/taining_template.dart';
import 'package:secound_version/widgets/txt_1.dart';

class StudentSideAllTrainings extends StatelessWidget {
  const StudentSideAllTrainings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          leading: LeadingIcon(),
          centerTitle: true,
          title: Text1(
            text: 'الدورات المتاحة',
            size: 16,
            color: Colors.black,
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            DefaultPhoto(
              image: 'assets/z3.png',
              height: height * 0.30,
              width: width * 0.75,
            ),

            Container(
              margin:const EdgeInsets.symmetric(horizontal: 20),
                     padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade600),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade50),
              child:const Text(
                      'للطالب الحق في الحصول علي دورة واحدة مجانية فقط في السنتين الاخيرة والقبل الاخيرة',
                      style:  TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    ),
            ),
             SizedBox(
              height: height*0.02,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('trainings')
                    .snapshots(),
                builder: (context, snapShot) {
                  if (snapShot.connectionState == ConnectionState.waiting)
                    // ignore: curly_braces_in_flow_control_structures
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.blue,
                      backgroundColor: Colors.yellow,
                    ));
                  if (snapShot.data!.docs.isEmpty) {
                    return const Center(
                        child: FittedBox(
                      child: Text(
                        'الدورات الجديدة سوف تظهر هنا😊',
                        style: TextStyle(fontSize: 20),
                        softWrap: true,
                      ),
                    ));
                  }
                  var data = snapShot.data;
                  if (snapShot.hasData) {
                    return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: data!.docs.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              //   TextRich(text: '', title: Training.fromJson(data.docs[index]).sponsor.toString()),
                              const SizedBox(
                                height: defaultPading * 2,
                              ),
                              DefaultContainer3(
                                  image: 'assets/z6.png',
                                  onPressed: () {
                                    NavigationService.instance.goTO(
                                        context,
                                        JoinTraining(
                                            training: Training.fromJson(
                                                data.docs[index])));
                                  },
                                  text: Training.fromJson(data.docs[index])
                                      .title
                                      .toString()),
                            ],
                          );
                        });
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ));
  }
}
