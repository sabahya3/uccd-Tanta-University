// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:secound_version/widgets/default_container_2.dart';
import 'package:secound_version/widgets/leading_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail1 extends StatelessWidget {
  const Detail1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;


    return Scaffold(
        appBar: AppBar(
          leading:  LeadingIcon(),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  width: width,
                  height: height*0.35,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/d4.png')),
                  )),
              DefaultContainer3(
                image: 'assets/d5.png',
                onPressed: () async {
                  const url = 'https://www.facebook.com/UccdEngTanta';
                  if (await canLaunch(url)) {
                    await launch(url, forceSafariVC: false);
                  }
                },
                text: 'Contact With Facebook',
              ),
              DefaultContainer3(
                image: 'assets/d6.png',
                onPressed: () async {
                  const phoneNumber = '+201555351523';
                  const url = 'tel:$phoneNumber';
                  if (await canLaunch(url)) {
                    await launch(
                      url,
                    );
                  }
                },
                text: 'Contact With WhatsApp',
              ),
              DefaultContainer3(
                image: 'assets/d7.png',
                onPressed: () async {
                  const url = 'https://www.linkedin.com/in/uccd-tanta-eng/';
                  if (await canLaunch(url)) {
                    await launch(url, forceSafariVC: false);
                  }
                },
                text: 'Contact With linkedin',
              ),
              DefaultContainer3(
                image: 'assets/d8.png',
                onPressed: () async {
                  const url = 'https://www.instagram.com/uccdeng/';
                  if (await canLaunch(url)) {
                    await launch(url, forceSafariVC: false);
                  }
                },
                text: 'Contact With Instagram',
              ),
              DefaultContainer3(
                image: 'assets/d9.png',
                onPressed: () async {
                  const url = 'https://t.me/+11SXNFzXwcNlYTg0';
                  if (await canLaunch(url)) {
                    await launch(url, forceSafariVC: false);
                  }
                },
                text: 'Contact With Telegram',
              ),
            ]),
          ),
        ));
  }
}
