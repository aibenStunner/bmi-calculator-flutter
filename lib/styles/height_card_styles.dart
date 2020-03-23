import 'package:bmi_calculator/utils/widget_utils.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

double marginBottomAdapted(BuildContext context) =>
    screenAwareSize(kHeightMarginBottom, context);

double marginTopAdapted(BuildContext context) =>
    screenAwareSize(kHeightMarginTop, context);

double circleSizeAdapted(BuildContext context) =>
    screenAwareSize(kHeightCircleSize, context);
