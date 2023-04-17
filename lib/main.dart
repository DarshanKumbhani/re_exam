import 'package:flutter/material.dart';
import 'package:re_exam/screen/add.dart';
import 'package:re_exam/screen/homescreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => Home(),
        'add':(context) => Add(),
      },

    )
  );
}

























