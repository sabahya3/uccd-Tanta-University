import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:secound_version/models/resume_model.dart';

import 'package:secound_version/services/db_services.dart';
import 'package:secound_version/services/navigation_services.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/views/admin_screens/available_resumes.dart';
import 'package:secound_version/views/mohakat_almokablah.dart';
import 'package:secound_version/widgets/custom_view.dart';
import 'package:secound_version/widgets/leading_icon.dart';

class AllResumes extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  AllResumes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
     leading: LeadingIcon(),
        title: const Text('السير الذاتية الحالية ',style: TextStyle(color: Colors.black),),
      ),
      body: Column(
        children: [
             DefaultPhoto(image: 'assets/f3.png'),
            const SizedBox(
              height: defaultPading * 2,
            ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: DbServices.instance.getAllCardsInDb('resume'),
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
                      'الطلاب المسجلين سوف يظهرون هنا😊',
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: defaultPading),
                            child: CustomView(
                                onTap: () {
                                  NavigationService.instance.goTO(
                                      context,
                                      CurrentResume(
                                        resume: Resume.fromDocument(data.docs[index]),
                                      ));
                                },
                                txt: Resume.fromDocument(data.docs[index])
                                    .userName
                                    .toString()));
                      });
                }
          
                return const Text("");
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Resume.fromDocument(data.docs[index])
//                                         .country
//                                         .toString()

//Student.fromDocument(data.docs[index])
// .userName
//.toString()

/*
                            
                          
                            */
