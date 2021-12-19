import 'package:flutter/material.dart';
import 'package:flutterhttp/screens/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.amber,
    ),
    title: 'Http app',
    home: HomePage(),
  ));
}
