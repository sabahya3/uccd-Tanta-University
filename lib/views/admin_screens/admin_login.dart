// ignore_for_file: must_be_immutable


import 'package:flutter/material.dart';
import 'package:secound_version/services/dialog_service.dart';
import 'package:secound_version/services/navigation_services.dart';
import 'package:secound_version/services/sign_in_service.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/views/admin_screens/home_screen_admin.dart';
import 'package:secound_version/widgets/custom_txt_form_field.dart';
import 'package:secound_version/widgets/txt_1.dart';
import 'package:secound_version/widgets/txt_button.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  var email = TextEditingController();

  var password = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Sign-In',
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.fact_check_rounded,
                          color: primaryColor,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 130,
                      height: 1.5,
                      color: aprimary,
                    )
                  ],
                ),
                const SizedBox(
                  height: defaultPading / 2,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.27,
                    child: Image.asset( "assets/admin.jpg")),
                const SizedBox(
                  height: defaultPading / 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text1(text: 'Enter Your Email'),
                    const SizedBox(
                      height: 7,
                    ),
                    DefaultFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the email';
                          } else if (!email.text.contains("@") ||
                              !email.text.contains('.com')) {
                            return 'Email address must contain @example.com';
                          }
                        },
                        controller: email,
                        type: TextInputType.emailAddress,
                        icon: Icons.email_outlined),
                    const SizedBox(
                      height: defaultPading,
                    ),
                    Text1(text: 'Enter Your Password'),
                    const SizedBox(
                      height: 7,
                    ),
                    DefaultFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter the password';
                        }
                      },
                      controller: password,
                      type: TextInputType.visiblePassword,
                      icon: Icons.lock_outlined,
                      isPassword: isPassword,
                      suffix: isPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      suffixPress: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                    ),
                    const SizedBox(
                      height: defaultPading,
                    ),
                    DefaultButton(
                      text: 'Sign-In',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          var valid = SignInService.instance
                              .signInWithEAndPass(email.text, password.text,false);
                          valid.then((value) => {
                                if (value == false)
                                  {
                                    DialogService.instance.niceSnackBar(
                                        'Alert',
                                        'Wrong password provided for that user',
                                        context),
                                           password.clear()
                                  }
                                else if (value == null)
                                  {
                                    DialogService.instance.niceSnackBar(
                                        'Alert',
                                        'No user found for that email.',
                                        context),
                                               password.clear(),
                                               email.clear()
                                  }
                                else
                                  {
                                    DialogService.instance.niceSnackBar(
                                        '', 'Welcome ${email.text}', context),
                                    NavigationService.instance.goToAndReplace(
                                        context, const HomeScreenAdmin()),
                                        email.clear(),
                                        password.clear()
                                  }
                              });
                       
                          
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: defaultPading * 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text1(
                      text: 'Forget Password?',
                      color: primaryColor,
                    ),
                    const Divider(
                      thickness: 1.5,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                 
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
