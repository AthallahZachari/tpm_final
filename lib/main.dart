import 'package:flutter/material.dart';
import 'package:fp_tpm/pages/home_page.dart';
import 'package:fp_tpm/pages/login_page.dart';
import 'package:fp_tpm/pages/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: WelcomePage(),
      home: LoginPage(),
      theme: ThemeData(fontFamily: 'Poppins'),
    );
  }
}

