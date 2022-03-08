// ignore_for_file: must_be_immutable
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:secound_version/services/navigation_services.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/views/almashourat.dart';
import 'package:secound_version/views/drawer_page.dart';

import 'package:secound_version/views/hiring.dart';
import 'package:secound_version/views/student_side_get_all_trainings.dart';

import 'package:secound_version/views/werash_al_amal.dart';
import 'package:secound_version/widgets/default_container_1.dart';


class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
      
          iconTheme: IconThemeData(color: primaryColor),
        ),
        drawer: const SafeArea(child: DrawerPage()),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.20,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/f1.jpeg'),
                          colorFilter: ColorFilter.mode(
                              Colors.black87, BlendMode.dstATop),
                          fit: BoxFit.fitHeight)),
                ),
                const SizedBox(
                  height: defaultPading * 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultContainer(
                      image: 'assets/a1.png',
                      text: 'ورش العمل',
                      onPress: () {
                        NavigationService.instance
                            .goTO(context, const FirstPage());
                      },
                    ),
                    DefaultContainer(
                      image: 'assets/a2.png',
                      text: 'الدورات التدريبية',
                      onPress: () {
                        NavigationService.instance
                            .goTO(context, const StudentSideAllTrainings());
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultContainer(
                      image: 'assets/a4.png',
                      text: 'التوظيف',
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ThirdPage()));
                      },
                    ),
                    DefaultContainer(
                      image: 'assets/a3.png',
                      text: 'المشورات الفردية',
                      onPress: () {
                        NavigationService.instance
                            .goTO(context, const FourthPage());
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultContainer(
                      image: 'assets/a5.png',
                      text: 'الشهادات المتاحة',
                      onPress: () {},
                    ),
                    DefaultContainer(
                      image: 'assets/a6.png',
                      text: 'فريق العمل والمتطوعين',
                      onPress: () {},
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: Image.asset(
                          'assets/wee.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Text(
                        '...قادرون باختلاف',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
