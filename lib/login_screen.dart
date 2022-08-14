// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:game/firebase_auth.dart';
import 'package:game/show_dialog.dart';

import 'custom_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController(text: "+251");

  TextEditingController passwordController = TextEditingController();
  var isObscured = false;
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(
              flex: 2,
              child: Container(
                width: width,
                decoration: BoxDecoration(
                    color: color1,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(3, 3),
                          color: Colors.grey,
                          blurRadius: 3,
                          spreadRadius: 3)
                    ],
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(width))),
                child: Center(
                    child: Text(
                  "Engida",
                  style: title1,
                )),
              )),
          Expanded(
              flex: 7,
              child: Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.number,
                            validator: ((value) {
                              if (double.tryParse(value!) == null) {
                                return "it should only contain digit only";
                              } else if (value.length != 13) {
                                return "invalid phone number length";
                              }
                              return null;
                            }),
                            controller: phoneController,
                            decoration: InputDecoration(
                                hintText: "phone number",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final isValid = _formKey.currentState!.validate();
                              if (isValid) {
                                FocusManager.instance.primaryFocus?.unfocus();
                                await FirebasePhone()
                                    .phoneLogin(context, phoneController.text);
                              }
                            },
                            child: Container(
                                child: Center(
                                  child: Text(
                                    "login",
                                    style: body,
                                  ),
                                ),
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: color1,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(3, 3),
                                          color: Colors.grey,
                                          spreadRadius: 3,
                                          blurRadius: 3),
                                    ])),
                          ),
                        ])),
              )),
        ]),
      ),
    );
  }
}
