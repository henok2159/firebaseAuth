import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:game/login_screen.dart';
import 'package:game/waiting_screen.dart';

import 'home_page.dart';

class Main_Page extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          }
          //else if (snapshot.connectionState == ConnectionState.active) {
          //   return WaitingScreen();
          // }
          else
            return LoginScreen();
        },
      ),
    );
  }
}
