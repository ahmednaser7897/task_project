//Lesson #1 Toast

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

void buildToast(BuildContext ctx, String text) {
  showToast(
    text,
    backgroundColor: Colors.black,
    textStyle: const TextStyle(color: Colors.white),
    context: ctx,
    animation: StyledToastAnimation.scale,
    reverseAnimation: StyledToastAnimation.fade,
    position: StyledToastPosition.bottom,
    animDuration: const Duration(seconds: 1),
    duration: const Duration(seconds: 4),
    curve: Curves.elasticOut,
    reverseCurve: Curves.linear,
  );
}
