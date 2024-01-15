import 'package:application1/login.dart';
import 'package:application1/registration.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => MyLogin(),
      'registration': (context) => myregistration()
    },
  ));
}
