import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:secound_version/firebase_options.dart';
import 'package:secound_version/services/navigation_services.dart';
import 'package:secound_version/views/home_page.dart';
import 'package:secound_version/views/login.dart';
import 'package:secound_version/views/on_boarding.dart';

import 'views/admin_screens/admin_or_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark))),
      debugShowCheckedModeBanner: false,
      initialRoute: "adminOrUser",
      routes: {
        "onBorarding": (context) => const HomePage(),
        "signIn": (context) => const SignIn(),
        "firstScreen": (context) => const FirstScreen(),
        "adminOrUser": (context) => const AdminOrUser()
      },
      navigatorKey: NavigationService.instance.navigationKey,
      title: 'Flutter Demo',
    );
  }
}
