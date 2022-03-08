import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:secound_version/models/opportiunity_model.dart';
import 'package:secound_version/models/training_model.dart';
import 'package:secound_version/services/db_services.dart';
import 'package:secound_version/services/navigation_services.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/views/admin_screens/work_shop_students.dart';
import 'package:secound_version/views/mohakat_almokablah.dart';

import 'package:secound_version/widgets/leading_icon.dart';
import 'package:secound_version/widgets/opportiunity_template.dart';
import 'package:secound_version/widgets/taining_template.dart';

class AvailableOpportiunity extends StatelessWidget {
  const AvailableOpportiunity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          leading: LeadingIcon(),
        ),
        body: Column(
          children: [
            DefaultPhoto(
              image: 'assets/z3.png',
              height: height * 0.30,
              width: width * 0.75,
            ),
            const SizedBox(
              height: defaultPading * 2,
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
                        'الوظائف الجديدة سوف تظهر هنا😊',
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
                          return Padding(
                            padding: const EdgeInsets.all(defaultPading),
                            child: OpportiunityTemplate(
                              height: height,
                              width: width,
                              go: () {
                                NavigationService.instance.goTO(
                                    context,
                                    ModelStudents(
                                        model:
                                            Opportiunity.fromJson(data.docs[index]),
                                        table: 'opportiunities'));
                              },
                              text: Opportiunity.fromJson(data.docs[index])
                                  .title
                                  .toString(),
                              icon: Icons.content_paste,
                              remove: () {
                                DbServices.instance.removeModel(
                                    table: 'opportiunities',
                                    document:
                                        Opportiunity.fromJson(data.docs[index])
                                            .doc
                                            .toString());
                              },
                              model: Opportiunity.fromJson(data.docs[index]),
                              date: Opportiunity.fromJson(data.docs[index]).date,
                            ),
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
