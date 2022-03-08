// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:secound_version/models/student_model.dart';
import 'package:secound_version/services/db_services.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/utils/constants.dart';
import 'package:secound_version/widgets/leading_icon.dart';
import 'package:secound_version/widgets/rich1_text.dart';
import 'package:secound_version/widgets/txt_1.dart';

class ModelStudents extends StatelessWidget {
  ModelStudents({Key? key, required this.model,required this.table}) : super(key: key);
  var model;
  String table;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LeadingIcon(),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: DbServices.instance
            .getAllStudentsInCurrentModel(model, table),
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
                'المتقدمين سوف يظهرون هنا😊',
                style: TextStyle(fontSize: 20),
                softWrap: true,
              ),
            ));
          }
          if (snapShot.hasData) {
            var data = snapShot.data;

            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: data!.docs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Text1(
                          text:'قائمة المتقدمين',
                          size: 25,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: defaultPading,
                        ),
                        Center(
                          child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(defaultPading),
                              decoration: xdeco,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichTexty(
                                    text1: 'Name:  ',
                                    text2:
                                        Student.fromDocument(data.docs[index])
                                            .userName
                                            .toString(),
                                  ),
                                  RichTexty(
                                    text1: 'Faculty:  ',
                                    text2:
                                        Student.fromDocument(data.docs[index])
                                            .faculity
                                            .toString(),
                                  ),
                                  RichTexty(
                                    text1: 'Country:  ',
                                    text2:
                                        Student.fromDocument(data.docs[index])
                                            .country
                                            .toString(),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  );
                });
          }

          return const Text("");
        },
      ),
    );
  }
}



//Student.fromDocument(data.docs[index])
                           // .userName
                            //.toString()