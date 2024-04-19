import 'dart:math' as math;

import 'package:flutter/material.dart';

class CustomDelayTween<T extends Object?> extends Tween<T> {
  CustomDelayTween({super.begin, super.end, required this.delay});
  final double delay;
  @override
  T lerp(double t) => super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);

  @override
  T evaluate(Animation<double> animation) => lerp(animation.value);
}
