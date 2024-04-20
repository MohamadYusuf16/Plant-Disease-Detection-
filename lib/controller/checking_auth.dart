// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plantguard_login/controller/login_page.dart';
import 'package:plantguard_login/mainscreen.dart';


class checking_auth extends StatefulWidget {
  const checking_auth({Key? key}) : super(key: key);

  @override
  State<checking_auth> createState() => _checking_authState();
}

class _checking_authState extends State<checking_auth> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MainScreen();
            } else {
              return LoginPage();
            }
          }),
    );
  }
}
