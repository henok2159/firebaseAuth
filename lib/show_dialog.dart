import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showOTPDialog({
  required BuildContext context,
  required TextEditingController codeController,
  required VoidCallback onPressed,
}) {
  showDialog(
      context: context,
      builder: (context) => SingleChildScrollView(
            child: Center(
              child: AlertDialog(
                insetPadding: EdgeInsets.symmetric(vertical: 200),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                title: Text("Enter OTP"),
                content: Column(
                  children: [
                    TextField(
                      controller: codeController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    child: Text("cancel"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(onPressed: onPressed, child: Text("Done")),
                ],
              ),
            ),
          ),
      barrierDismissible: false);
}
