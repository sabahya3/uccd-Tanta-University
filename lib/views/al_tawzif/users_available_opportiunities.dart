import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:secound_version/models/opportiunity_model.dart';
import 'package:secound_version/models/training_model.dart';
import 'package:secound_version/services/navigation_services.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/views/al_tawzif/join_job.dart';
import 'package:secound_version/views/mohakat_almokablah.dart';
import 'package:secound_version/views/studet_side_join_training.dart';
import 'package:secound_version/widgets/default_container_2.dart';

import 'package:secound_version/widgets/leading_icon.dart';
import 'package:secound_version/widgets/txt_1.dart';

class StudentSideAllOpportiunities extends StatelessWidget {
  const StudentSideAllOpportiunities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          leading: LeadingIcon(),
          centerTitle: true,
          title: Text1(
            text: 'الفرص المتاحة',
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
            SizedBox(
              height: height * 0.02,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('opportiunities')
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
                        'الفرص الجديدة سوف تظهر هنا😊',
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
                                  image: 'assets/d10.png',
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => JoinJob(
                                                  opportiunity:
                                                      Opportiunity.fromJson(
                                                          data.docs[index]),
                                                )));
                                  },
                                  text: Opportiunity.fromJson(data.docs[index])
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

/*
Training.fromJson(
                                               )
DefaultContainer3(
                image: 'assets/d10.png',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Detail3()));
                },
                text: 'Flutter Developer'),
 */