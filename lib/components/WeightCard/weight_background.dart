import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeightBackground extends StatelessWidget {
  final Widget child;

  const WeightBackground({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: screenAwareSize(100.0, context),
          decoration: BoxDecoration(
            color: kInactiveCardColor,
            borderRadius: BorderRadius.circular(screenAwareSize(50.0, context)),
          ),
          child: child,
        ),
        SvgPicture.asset(
          'images/weight_arrow.svg',
          color: kPrimaryColor,
          height: screenAwareSize(10.0, context),
          width: screenAwareSize(10.0, context),
        )
      ],
    );
  }
}
