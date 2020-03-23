import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/models/gender.dart';
import 'package:bmi_calculator/styles/gender_card_styles.dart';
import 'package:bmi_calculator/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'gender_line.dart';

class GenderIconTranslated extends StatelessWidget {
  final Gender gender;
  final bool isSelected;

  const GenderIconTranslated({Key key, this.gender, this.isSelected = false})
      : super(key: key);

  static final Map<Gender, String> _genderImages = {
    Gender.female: 'images/gender_female.svg',
    Gender.other: 'images/gender_other.svg',
    Gender.male: 'images/gender_male.svg',
  };

  bool get _isOtherGender => gender == Gender.other;

  String get _assetName => _genderImages[gender];

  double _iconSize(BuildContext context) {
    return screenAwareSize(_isOtherGender ? 27.0 : 21.0, context);
  }

  double _genderLeftPadding(BuildContext context) {
    return screenAwareSize(_isOtherGender ? 8.0 : 0.0, context);
  }

  @override
  Widget build(BuildContext context) {
    Widget icon = Padding(
      padding: EdgeInsets.only(left: _genderLeftPadding(context)),
      child: SvgPicture.asset(
        _assetName,
        height: _iconSize(context),
        width: _iconSize(context),
        color: isSelected ? kPrimaryColor : kGenderIconColor,
      ),
    );

    Widget rotatedIcon = Transform.rotate(
      angle: -genderAngles[gender],
      child: icon,
    );

    Widget iconWithALine = Padding(
      padding: EdgeInsets.only(bottom: circleSize(context) / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[rotatedIcon, GenderLine()],
      ),
    );

    Widget rotatedIconWithALine = Transform.rotate(
      angle: genderAngles[gender],
      child: iconWithALine,
      alignment: Alignment.bottomCenter,
    );

    Widget centeredIconWithALine = Padding(
      padding: EdgeInsets.only(bottom: circleSize(context) / 2),
      child: rotatedIconWithALine,
    );

    return centeredIconWithALine;
  }
}
