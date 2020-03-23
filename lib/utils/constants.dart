import 'package:flutter/material.dart';

const Color kActiveCardColor = Color(0xFF1D1E33);
const Color kInactiveCardColor = Color(0xFF111328);
const Color kPrimaryColor = Color(0xFFEB1555);
const Color kBackGroundColor = Color(0xFF0A0E21);
const Color kScaffoldColor = Color(0xFF0A0E21);
const Color kLabelTextColor = Color(0xFF8D8E98);

const kCardTitleStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w600,
  color: kLabelTextColor,
);

const kCardSubtitleStyle = TextStyle(
  fontSize: 11.0,
  color: kLabelTextColor,
);

const Color kGenderIconColor = Color(0xFF4C4F5E);

const kWeightDefaultTextStyle = TextStyle(
  color: kGenderIconColor,
  fontSize: 18.0,
);

const kWeightHighlightTextStyle = TextStyle(
  color: kPrimaryColor,
  fontSize: 35.0,
);

const kHeightLabelsTextStyle = TextStyle(
  color: kGenderIconColor,
  fontSize: kHeightLabelsFontSize,
);

const double kHeightCircleSize = 32.0;
const double kHeightMarginBottom = kHeightCircleSize / 2;
const double kHeightMarginTop = 26.0;
const double kHeightSelectedLabelFontSize = 14.0;
const double kHeightLabelsFontSize = 13.0;
const Color kHeightLabelsGrey = const Color.fromRGBO(216, 217, 223, 1.0);
