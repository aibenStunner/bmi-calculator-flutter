import 'package:bmi_calculator/components/appBar.dart';
import 'package:bmi_calculator/components/result_card.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/models/gender.dart';
import 'package:bmi_calculator/styles/input_screen_styles.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/core/calculator.dart';

class ResultScreen extends StatefulWidget {
  final int height, weight;
  final Gender gender;

  const ResultScreen({Key key, this.height, this.weight, this.gender})
      : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: bmiAppBar(isInputPage: false),
        preferredSize: Size.fromHeight(appBarHeight(context)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ResultCard(
            bmi: calculateBMI(height: widget.height, weight: widget.weight),
            minWeight: calculateMinNormalWeight(height: widget.height),
            maxWeight: calculateMaxNormalWeight(height: widget.height),
          ),
          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.grey,
                size: 28.0,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Container(
              height: 52.0,
              width: 80.0,
              child: RaisedButton(
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                  size: 28.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                onPressed: () => Navigator.of(context).pop(),
                color: kPrimaryColor,
              )),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: IconButton(
              color: kActiveCardColor,
              icon: Icon(
                Icons.share,
                color: Colors.grey,
                size: 28.0,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
