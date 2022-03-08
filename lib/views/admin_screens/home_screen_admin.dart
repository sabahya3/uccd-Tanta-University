// ignore_for_file: must_be_immutable


import 'package:flutter/material.dart';
import 'package:secound_version/services/navigation_services.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/views/admin_screens/create_or_get_work_shops.dart';
import 'package:secound_version/views/admin_screens/get_or_create_training.dart';
import 'package:secound_version/views/admin_screens/nake_or_create_resume.dart';
import 'package:secound_version/views/al_tawzif/create_or_get_all_opportunities.dart';
import 'package:secound_version/views/drawer_page.dart';
import 'package:secound_version/widgets/default_container_1.dart';

class HomeScreenAdmin extends StatelessWidget {
  const HomeScreenAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                          colorFilter:
                              ColorFilter.mode(Colors.black87, BlendMode.dstATop),
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
                            .goTO(context, const CreateOrGetAllWorkShops());
                      },
                    ),
                    DefaultContainer(
                      image: 'assets/a2.png',
                      text: 'الدورات التدريبية',
                      onPress: () {
                        NavigationService.instance
                            .goTO(context, const CreateOrGetTraining());
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
                                builder: (context) => const CreateOrGetAllOpportiunities()));
                      },
                    ),
                    DefaultContainer(
                      image: 'assets/a3.png',
                      text: 'المشورات الفردية',
                      onPress: () {
                        NavigationService.instance.goTO(context, NakdOrGetResumes());
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
              
              ],
            ),
          ),
        ));
  }
}
