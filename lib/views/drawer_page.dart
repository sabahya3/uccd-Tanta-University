import 'package:flutter/material.dart';
import 'package:secound_version/services/db_services.dart';
import 'package:secound_version/services/navigation_services.dart';
import 'package:secound_version/services/sign_in_service.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/views/admin_screens/admin_or_user.dart';
import 'package:secound_version/views/ahmed.dart';
import 'package:secound_version/views/hamada.dart';
import 'package:secound_version/views/rami.dart';
import 'package:secound_version/widgets/default_container_2.dart';
import 'package:secound_version/widgets/leading_icon.dart';
import 'package:secound_version/widgets/personal_info.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';


class DrawerPage extends StatelessWidget {
  const DrawerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          top: defaultPading,
          left: defaultPading / 2,
          right: defaultPading / 2,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset('assets/f1.jpeg')),
                  LeadingIcon(
                    iconData: Icons.close,
                    color: primaryColor,
                  )
                ],
              ),
              const SizedBox(
                height: defaultPading * 2,
              ),
              const Text(
                'About Us',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18),
              ),
              const SizedBox(
                height: defaultPading / 2,
              ),
              Divider(
                color: thiColor,
                thickness: 0.5,
              ),
              const SizedBox(
                height: defaultPading * 2,
              ),
                            PersonalInfo(
                  text: 'Dr: Ahmed Aboulsaadat',
                  onPressed: () {
            
                            
                NavigationService.instance.goTO(context,const AhmedPage());
                            
                  }),
              PersonalInfo(
                text: 'Rami Hammad',
                onPressed: () {
               NavigationService.instance.goTO(context,const RamiPage());
                },
              ),
              PersonalInfo(
                  text: 'Hamada Yossri',
                  onPressed: () {
             
                NavigationService.instance.goTO(context,const HamadaPage());

                  }),
                   PersonalInfo(
                text: 'تسجيل الخروج',
                onPressed: () {
                  SignInService.instance.signOut();
               NavigationService.instance.goToAndReplace(context,const AdminOrUser());
                },),

              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/f2.jpeg')),
            ],
          ),
        ),
      ),
    );
  }
}
