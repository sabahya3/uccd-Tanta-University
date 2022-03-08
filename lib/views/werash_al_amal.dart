// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:secound_version/models/workshops_model.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/views/mohakat_almokablah.dart';
import 'package:secound_version/views/worker1.dart';
import 'package:secound_version/widgets/default_worker_container.dart';
import 'package:secound_version/widgets/leading_icon.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                  var data = snapShot.data;
                  if (snapShot.hasError) {
                    return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.black,
                      ),
                    );
                  } else if (!snapShot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.black,
                      ),
                    );
                  } else if (snapShot.hasData) {
                    return data!.docs.isEmpty
                        ? const Center(
                            child: Text('ورش العمل سوف تظهر هنا'),
                          )
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: data.docs.length,
                            itemBuilder: (context, index) {
                              /*    */

                              /* */
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: DefaultWorkContainer(
                                  height: height * 0.15,
                                  // width: width*0.50,
                                  text: WorkShops.fromJson(data.docs[index])
                                      .title
                                      .toString(),
                                  icon: Icons.assignment_turned_in,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Work1(
                                                  workShop: WorkShops.fromJson(
                                                      data.docs[index]),
                                                )));
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

/**Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPading),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                DefaultPhoto(image: 'assets/z1.png'),
                const SizedBox(
                  height: defaultPading * 2,
                ),
                DefaultWorkContainer(
                  text: 'ورشة عمل كتابة السيرة الذاتية',
                  icon: Icons.assignment_turned_in,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Work1()));
                  },
                ),
                DefaultWorkContainer(
                  text: 'ورشة مهارات المقابلات الشخصية',
                  icon: Icons.work_rounded,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Work2()));
                  },
                ),
                DefaultWorkContainer(
                  text: 'ورشة التدريب لسوق العمل',
                  icon: Icons.accessibility_rounded,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Work3()));
                  },
                ),
                DefaultWorkContainer(
                  text: 'ورشة تدريب لغات البرمجة',
                  icon: Icons.flutter_dash_rounded,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Work4()));
                  },
                ),
              ],
            ),
          ),
        ) */
