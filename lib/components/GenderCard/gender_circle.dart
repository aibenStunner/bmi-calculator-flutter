import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/styles/gender_card_styles.dart';
import 'package:flutter/material.dart';

class GenderCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: circleSize(context),
      height: circleSize(context),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kInactiveCardColor,
      ),
    );
  }
}
