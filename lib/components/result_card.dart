import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final double bmi, minWeight, maxWeight;

  ResultCard({Key key, this.bmi, this.minWeight, this.maxWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kActiveCardColor,
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Text(
                '🔥',
                style: TextStyle(fontSize: 80.0),
              ),
              Text(
                bmi.toStringAsFixed(1),
                style: TextStyle(
                    fontSize: 140.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'BMI = ${bmi.toStringAsFixed(2)} kg/m²',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'Normal BMI weight range for the height:\n${minWeight.round()}kg - ${maxWeight.round()}kg',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF24D876),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
