
import 'package:flutter/material.dart';
import 'package:secound_version/services/navigation_services.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/views/mohakat_almokablah.dart';
import 'package:secound_version/views/nakd_al_serah.dart';
import 'package:secound_version/widgets/default_container_2.dart';
import 'package:secound_version/widgets/leading_icon.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LeadingIcon(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPading),
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.40,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/f3.png')),
                )),
            const SizedBox(
              height: defaultPading,
            ),
            DefaultContainer3(
                height: 60,
                size: 20,
                image: 'assets/f4.png',
                onPressed: () {
                  NavigationService.instance.goTO(context, Data1());
                },
                text: 'محاكاة المقابلة الشخصية'),
            DefaultContainer3(
                height: 60,
                size: 20,
                image: 'assets/f5.png',
                onPressed: () {
              
                  NavigationService.instance.goTO(context,const Data2());
                },
                text: 'نقد السيرة الذاتية'),
          ],
        ),
      ),
    );
  }
}
