import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:game/show_dialog.dart';

class FirebasePhone {
  Future<void> phoneLogin(BuildContext context, String phoneNumber) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    TextEditingController codeController = TextEditingController();
    await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
          Navigator.of(context).pop();
        },
        verificationFailed: (e) {
          SnackBar(
            content: Text(e.message.toString()),
          );
        },
        codeSent: (String verificationId, int? resend) {
          showOTPDialog(
              context: context,
              codeController: codeController,
              onPressed: () async {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: codeController.text.trim());
                await auth.signInWithCredential(credential);
                Navigator.of(context).pop();
              });
        },
        codeAutoRetrievalTimeout: (String a) {});
  }
}
