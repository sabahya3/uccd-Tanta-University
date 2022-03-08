import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:secound_version/models/workshops_model.dart';
import 'package:secound_version/services/db_services.dart';
import 'package:secound_version/services/navigation_services.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/views/admin_screens/work_shop_students.dart';
import 'package:secound_version/views/mohakat_almokablah.dart';

import 'package:secound_version/widgets/leading_icon.dart';
import 'package:secound_version/widgets/workshop_template_admin.dart';

class GetAllWorkShops extends StatelessWidget {
  const GetAllWorkShops({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final localizations = MaterialLocalizations.of(context);

    return Scaffold(
        appBar: AppBar(
          leading: LeadingIcon(),
        ),
        body: Column(
          children: [
            DefaultPhoto(
              image: 'assets/z1.png',
              height: height * 0.30,
              width: width * 0.75,
            ),
            const SizedBox(
              height: defaultPading * 2,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('workShops')
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
                        'ورش العمل الجديدة سوف تظهر هنا 😊',
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
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: WorkShopTemplate(
                              go: () {
                                NavigationService.instance.goTO(
                                    context,
                                    ModelStudents(
                                      model:
                                          WorkShops.fromJson(data.docs[index]),
                                      table: 'workShops',
                                    ));
                              },
                              time: localizations
                                  .formatTimeOfDay(TimeOfDay.fromDateTime(
                                      DateTime.parse(
                                          WorkShops.fromJson(data.docs[index])
                                              .time
                                              .toString())))
                                  .toString(),
                              model: WorkShops.fromJson(data.docs[index]),
                              icon: Icons.date_range,
                              text: WorkShops.fromJson(data.docs[index])
                                  .title
                                  .toString(),
                              date: WorkShops.fromJson(data.docs[index])
                                  .date
                                  .toString(),
                              width: width,
                              height: height,
                              remove: () async {
                                DbServices.instance.removeModel(
                                    table: 'workShops',
                                    document:
                                        WorkShops.fromJson(data.docs[index])
                                            .doc
                                            .toString());
                              },
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
