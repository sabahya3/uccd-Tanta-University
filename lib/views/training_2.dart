
import 'package:flutter/material.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/views/list_1.dart';
import 'package:secound_version/views/list_2.dart';
import 'package:secound_version/views/list_3.dart';
import 'package:secound_version/views/mohakat_almokablah.dart';
import 'package:secound_version/widgets/default_worker_container.dart';
import 'package:secound_version/widgets/leading_icon.dart';
import 'package:secound_version/widgets/rich_text.dart';
import 'package:secound_version/widgets/text_direction.dart';


class Training2 extends StatelessWidget {
  const Training2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LeadingIcon(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPading),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              TextRich(text: '(Tt)', title: 'Technical trainings'),
              const SizedBox(
                height: defaultPading,
              ),
              DefaultPhoto(image: 'assets/z5.png'),
              const SizedBox(
                height: defaultPading,
              ),
              TextDescription(
                  text:
                      '   بيقدر الطالب ياخد كورس واحد من الكورسات المعروضه  فى السنه قبل الاخيره و كورس واحد كمان فى السنه الأخيره '),
              const SizedBox(
                height: defaultPading,
              ),
              DefaultWorkContainer(
                  text: 'American chamber',
                  icon: Icons.public_rounded,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => List1()));
                  }),
              DefaultWorkContainer(
                  text: 'School of engineering',
                  icon: Icons.engineering_rounded,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => List2()));
                  }),
              DefaultWorkContainer(
                  text: 'School of science',
                  icon: Icons.science_rounded,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => List3()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
