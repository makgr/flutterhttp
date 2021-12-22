import 'package:flutter/material.dart';
import 'package:flutterhttp/screens/login_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.amber,
    ),
    title: 'Http app',
    home: LoginScreen(),
  ));
}
