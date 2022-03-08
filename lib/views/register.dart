// ignore_for_file: must_be_immutable
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:secound_version/services/db_services.dart';
import 'package:secound_version/services/dialog_service.dart';
import 'package:secound_version/services/navigation_services.dart';
import 'package:secound_version/services/sign_in_service.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/views/home_page.dart';
import 'package:secound_version/views/login.dart';
import 'package:secound_version/widgets/custom_txt_form_field.dart';
import 'package:secound_version/widgets/txt_1.dart';
import 'package:secound_version/widgets/txt_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController fName;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController id;
  late TextEditingController country;
  late TextEditingController faculty;
  late TextEditingController studyLevel;
  var formKey = GlobalKey<FormState>();
  bool isChecked = false;
  bool isPassword = true;
  String? _uid;
  @override
  void initState() {
    super.initState();
    fName = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    id = TextEditingController();
    country = TextEditingController();
    faculty = TextEditingController();
    studyLevel = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    fName.dispose();
    email.dispose();
    password.dispose();
    id.dispose();
    country.dispose();
    faculty.dispose();
  }

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
                          'Sign-Up',
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
                      width: 140,
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
                    height: MediaQuery.of(context).size.height * 0.20,
                    child: Image.asset('assets/s2.png')),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text1(text: 'Enter Your  Name'),
                    const SizedBox(
                      height: 7,
                    ),
                    DefaultFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the name';
                          }
                        },
                        controller: fName,
                        type: TextInputType.name,
                        icon: Icons.person_outlined),
                    const SizedBox(
                      height: defaultPading,
                    ),
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
                    Text1(text: 'Enter Your  Faculty'),
                    const SizedBox(
                      height: 7,
                    ),
                    DefaultFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the Faculty';
                          }
                        },
                        controller: faculty,
                        type: TextInputType.name,
                        icon: Icons.verified_outlined),
                    const SizedBox(
                      height: defaultPading,
                    ),
                    Text1(text: 'Enter Your  National ID'),
                    const SizedBox(
                      height: 7,
                    ),
                    DefaultFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the id';
                          } else if (id.text.length < 14 ||
                              id.text.length > 14) {
                            id.clear();
                            return 'please the Id must be 14 numbers';
                          }
                        },
                        controller: id,
                        type: TextInputType.phone,
                        icon: Icons.pin_outlined),
                    const SizedBox(
                      height: defaultPading,
                    ),
                    //==================
                    Text1(text: 'Enter your Study Level'),
                    const SizedBox(
                      height: 7,
                    ),
                    DefaultFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your study level';
                          } else if (studyLevel.text.length > 1) {
                            return 'please it must be a number from 1 to 5';
                          }
                        },
                        controller: studyLevel,
                        type: TextInputType.phone,
                        icon: Icons.pin_outlined),
                    const SizedBox(
                      height: defaultPading,
                    ),
                    //===================
                    Text1(text: 'Enter Your  Country'),
                    const SizedBox(
                      height: 7,
                    ),
                    DefaultFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the country';
                          }
                        },
                        controller: country,
                        type: TextInputType.name,
                        icon: Icons.flag_outlined),
                    const SizedBox(
                      height: defaultPading,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: primaryColor,
                            value: isChecked,
                            onChanged: (newValue) {
                              setState(() {
                                isChecked = newValue!;
                              });
                            }),
                        Text1(
                          text: 'Is Disabled?',
                        ),
                      ],
                    ),
                    DefaultButton(
                      text: 'Sign-Up',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          var valid = SignInService.instance
                              .signUpWithEmailAndPassword(
                                  email.text, password.text);
                          valid.then((value) => {
                                if (value == false)
                                  {
                                    DialogService.instance.niceSnackBar(
                                        'Alert',
                                        'The account already exists for that email.',
                                        context)
                                  }
                                else if (value == true)
                                  {
                                    DialogService.instance.niceSnackBar(
                                        'Alert',
                                        'The password provided is too weak.',
                                        context)
                                  }
                                else
                                  {
                                    _uid =
                                        FirebaseAuth.instance.currentUser!.uid,
                                    DbServices.instance.createUserInDb(
                                      faculty.text,
                                      country.text,
                                      fName.text,
                                      email.text.trim(),
                                      id.text,
                                      isChecked,
                                      password.text,
                                      _uid!,
                                      studyLevel.text,
                                    ),
                                    DialogService.instance.niceSnackBar(
                                        'Welcome', fName.text, context),
                                    NavigationService.instance
                                        .goToAndReplace(context, const FirstScreen())
                                  }
                              });
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: defaultPading,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text1(text: 'Already have an account'),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        NavigationService.instance.goToAndReplace(context,const SignIn());
                      },
                      child: Text1(
                        text: 'Sign-In',
                        color: primaryColor,
                      ),
                    )
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
