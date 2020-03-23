import 'package:bmi_calculator/components/GenderCard/gender_card.dart';
import 'package:bmi_calculator/components/HeightCard/height_card.dart';
import 'package:bmi_calculator/components/PacmanBar/pacman_slider.dart';
import 'package:bmi_calculator/components/WeightCard/weight_card.dart';
import 'package:bmi_calculator/components/appBar.dart';
import 'package:bmi_calculator/components/input_summary_card.dart';
import 'package:bmi_calculator/models/gender.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:bmi_calculator/styles/input_screen_styles.dart';
import 'package:bmi_calculator/utils/fade_route.dart';
import 'package:bmi_calculator/utils/transition_dot.dart';
import 'package:bmi_calculator/utils/widget_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  @override
  InputScreenState createState() {
    return new InputScreenState();
  }
}

class InputScreenState extends State<InputScreen>
    with TickerProviderStateMixin {
  AnimationController _submitAnimationController;
  Gender gender = Gender.other;
  int height = 180;
  int weight = 70;

  @override
  void initState() {
    super.initState();
    _submitAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _submitAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _goToResultPage().then((_) => _submitAnimationController.reset());
      }
    });
  }

  @override
  void dispose() {
    _submitAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: PreferredSize(
            child: bmiAppBar(),
            preferredSize: Size.fromHeight(appBarHeight(context)),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InputSummaryCard(
                gender: gender,
                weight: weight,
                height: height,
              ),
              Expanded(child: _buildCards(context)),
              _buildBottom(context),
            ],
          ),
        ),
        TransitionDot(animation: _submitAnimationController),
      ],
    );
  }

  Widget _buildCards(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Expanded(
                child: GenderCard(
                  gender: gender,
                  onChanged: (val) => setState(() => gender = val),
                ),
              ),
              Expanded(
                child: WeightCard(
                  weight: weight,
                  onChanged: (val) => setState(() => weight = val),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: HeightCard(
            height: height,
            onChanged: (val) => setState(() => height = val),
          ),
        )
      ],
    );
  }

  Widget _buildBottom(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenAwareSize(16.0, context),
        right: screenAwareSize(16.0, context),
        bottom: screenAwareSize(22.0, context),
        top: screenAwareSize(14.0, context),
      ),
      child: PacmanSlider(
        submitAnimationController: _submitAnimationController,
        onSubmit: onPacmanSubmit,
      ),
    );
  }

  void onPacmanSubmit() {
    _submitAnimationController.forward();
  }

  _goToResultPage() async {
    return Navigator.of(context).push(FadeRoute(
      builder: (context) => ResultScreen(
        weight: weight,
        height: height,
        gender: gender,
      ),
    ));
  }
}
