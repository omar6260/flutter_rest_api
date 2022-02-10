import 'package:fl_rest_app/screens/home.dart';
import 'package:fl_rest_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Sénégal',
      home: LoginScreen()));
}
