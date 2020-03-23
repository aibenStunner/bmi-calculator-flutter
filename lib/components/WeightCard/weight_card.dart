import 'package:bmi_calculator/components/WeightCard/weight_background.dart';
import 'package:bmi_calculator/components/WeightCard/weight_slider.dart';
import 'package:bmi_calculator/components/card_title.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/utils/widget_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeightCard extends StatelessWidget {
  final int weight;
  final ValueChanged<int> onChanged;

  const WeightCard({Key key, this.weight = 70, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kActiveCardColor,
      margin: EdgeInsets.only(
        left: screenAwareSize(16.0, context),
        right: screenAwareSize(4.0, context),
        top: screenAwareSize(4.0, context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CardTitle('WEIGHT', subtitle: 'kg'),
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenAwareSize(16.0, context)),
                child: _drawSlider(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawSlider() {
    return WeightBackground(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.isTight
              ? Container()
              : WeightSlider(
                  minValue: 30,
                  maxValue: 110,
                  value: weight,
                  onChanged: (val) => onChanged(val),
                  width: constraints.maxWidth,
                );
        },
      ),
    );
  }
}
