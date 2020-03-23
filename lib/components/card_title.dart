import 'package:bmi_calculator/utils/widget_utils.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CardTitle extends StatelessWidget {
  final String title, subtitle;

  const CardTitle(this.title, {Key key, this.subtitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: screenAwareSize(8.0, context),
            left: screenAwareSize(13.0, context),
            right: screenAwareSize(11.0, context),
            bottom: screenAwareSize(8.0, context),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: kCardTitleStyle,
              ),
              Text(
                subtitle ?? "",
                style: kCardSubtitleStyle,
              ),
            ],
          ),
        ),
        Divider(
          height: 1.0,
          color: Color.fromRGBO(143, 144, 156, 0.22),
        ),
      ],
    );
  }
}
