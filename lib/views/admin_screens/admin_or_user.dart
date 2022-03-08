import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:secound_version/services/dialog_service.dart';
import 'package:secound_version/services/navigation_services.dart';
import 'package:secound_version/services/sign_in_service.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/views/admin_screens/admin_login.dart';
import 'package:secound_version/views/admin_screens/home_screen_admin.dart';
import 'package:secound_version/views/home_page.dart';
import 'package:secound_version/views/login.dart';
import 'package:secound_version/widgets/default_container_4.dart';

class AdminOrUser extends StatelessWidget {
  const AdminOrUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
     
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                children: [
                  // Expanded(
                  //     child: SizedBox(
                  //   width: w * 0.03,
                  // )),
                  Expanded(
                    flex: 20,
                    child: DefaultContainerNetwork(
                        image: "assets/stu.png",
                        text: "Student",
                        onPress: () async {
                          if (SignInService.instance.loginOrnot() == false) {
                            NavigationService.instance
                                .goTO(context, const SignIn());
                          } else if (SignInService.instance.loginOrnot() ==
                              true) {
                            Status? currentStatus;
                            currentStatus =
                                await SignInService.instance.studentOrAdmin();

                            if (currentStatus == Status.student) {
                              NavigationService.instance
                                  .goTO(context, const FirstScreen());
                            } else if (currentStatus == Status.admin) {
                              DialogService.instance.niceSnackBar(
                                  '', 'You are an Admin', context);
                            } else if (currentStatus == Status.none) {
                              DialogService.instance.niceSnackBar(
                                  '', 'you dont have any account', context);
                            }
                          }

                          /*
                         :SignInService.instance.studentOrAdmin()==Status.student?NavigationService.instance.goTO(context, FirstScreen()):print('you are an admin');*/
                        }),
                  ),
                  Expanded(
                      child: SizedBox(
                    width: w * 0.03,
                  )),
                  Expanded(
                    flex: 20,
                    child: DefaultContainerNetwork(
                        image: "assets/admin.jpg",
                        text: "Admin",
                        onPress: () async {
                          if (SignInService.instance.loginOrnot() == false) {
                            NavigationService.instance
                                .goTO(context, const AdminLogin());
                          } else if (SignInService.instance.loginOrnot() ==
                              true) {
                            Status? currentStatus;
                            currentStatus =
                                await SignInService.instance.studentOrAdmin();

                            if (currentStatus == Status.student) {
                               DialogService.instance.niceSnackBar(
                                  '', 'You are a Student', context);
                            } else if (currentStatus == Status.admin) {
                                DialogService.instance.niceSnackBar(
                                  '', 'You are an Admin', context);
                              NavigationService.instance
                                  .goTO(context, const HomeScreenAdmin());
                            } else if (currentStatus == Status.none) {
                                DialogService.instance.niceSnackBar(
                                  '', 'You don\'t have any Account', context);
                            }
                          }
                        }),
                  ),
                  // Expanded(
                  //     child: SizedBox(
                  //   width: w * 0.03,
                  // )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
