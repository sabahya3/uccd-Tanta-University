// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:secound_version/services/navigation_services.dart';

import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/views/al_tawzif/users_available_opportiunities.dart';

import 'package:secound_version/views/available_oppurtunites.dart';
import 'package:secound_version/views/contact_with_companies.dart';

import 'package:secound_version/views/mohakat_almokablah.dart';

import 'package:secound_version/widgets/default_container_2.dart';

import 'package:secound_version/widgets/leading_icon.dart';




class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LeadingIcon(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPading, vertical: defaultPading),
        child: Column(
          children: [
            
            DefaultPhoto(image: 'assets/d1.jpeg'),
            const SizedBox(
              height: defaultPading,
            ),
            DefaultContainer3(
                image: 'assets/d2.png',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Detail1()));
                },
                text: 'التواصل مع المركز (للشركات)',
                size: 20),
            DefaultContainer3(
              image: 'assets/d3.png',
              onPressed: () {
           NavigationService.instance.goTO(context,const StudentSideAllOpportiunities());
              },
              text: 'الفرص المتاحة',
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
