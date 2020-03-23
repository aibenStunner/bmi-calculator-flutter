import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/styles/input_screen_styles.dart';
import 'package:bmi_calculator/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class bmiAppBar extends StatelessWidget {
  final bool isInputPage;
  static const String wavingHandEmoji = "\uD83D\uDC4B";
  static const String whiteSkinTone = "\uD83C\uDFFB";

  const bmiAppBar({Key key, this.isInputPage = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      child: Container(
        height: appBarHeight(context),
        color: kBackGroundColor,
        child: Padding(
          padding: EdgeInsets.all(screenAwareSize(16.0, context)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildLabel(context),
              _buildIcon(context),
            ],
          ),
        ),
      ),
    );
  }

  RichText _buildLabel(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style.copyWith(fontSize: 34.0),
        children: [
          TextSpan(
            text: isInputPage ? "Hi " : "Your BMI",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          TextSpan(text: isInputPage ? getEmoji(context) : ""),
        ],
      ),
    );
  }

  Padding _buildIcon(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenAwareSize(11.0, context)),
      child: SvgPicture.asset(
        'images/user.svg',
        height: screenAwareSize(20.0, context),
        width: screenAwareSize(20.0, context),
        color: kPrimaryColor,
      ),
    );
  }

  String getEmoji(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS
        ? wavingHandEmoji
        : wavingHandEmoji + whiteSkinTone;
  }
}
