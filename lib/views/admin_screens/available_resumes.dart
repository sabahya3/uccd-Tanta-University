import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:secound_version/models/resume_model.dart';

import 'package:secound_version/services/db_services.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/utils/constants.dart';
import 'package:secound_version/views/mohakat_almokablah.dart';
import 'package:secound_version/widgets/leading_icon.dart';
import 'package:secound_version/widgets/txt_1.dart';
import 'package:secound_version/widgets/txt_button.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class CurrentResume extends StatelessWidget {
  CurrentResume({Key? key,required this.resume}) : super(key: key);

Resume resume;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: LeadingIcon(),
      ),
      body:    Padding(
                   padding: const EdgeInsets.symmetric(horizontal: defaultPading),
                    child: Column(
          children: [
            DefaultPhoto(image: 'assets/z2.png'),
            const SizedBox(
              height: defaultPading * 2,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(defaultPading),
              decoration: xdeco,
              child: Column(
                children: [
                    Text1(
                        text:resume
                                        .userName
                                    .toString(),
                        size: 20,
                        color: Colors.black),
                    const SizedBox(
                      height: defaultPading,
                    ),
                    Text1(
                        text: resume
                                        .country
                                    .toString(),
                        size: 20,
                        color: Colors.black),
                ],
              ),
            ),
            const SizedBox(
              height: defaultPading * 2,
            ),
            DefaultButton(
                text: 'Open Cv In Browser',
                onPressed: ()async  {
                    final url = resume
                                        .resumeLink
                                    .toString();
                    if (await canLaunch(url)) {
                      await launch(url, forceSafariVC: false);
           
                    }

                })
          ],
        ),
                  )
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