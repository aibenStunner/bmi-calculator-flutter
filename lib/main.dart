import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/screens/input_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        primaryColor: kBackGroundColor,
        fontFamily: 'SF Pro Display',
        scaffoldBackgroundColor: kScaffoldColor,
      ),
      home: InputScreen(),
    );
  }
}
