// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';

extension Integer on int {
  dynamic delay(Function function) {
    Future.delayed(Duration(seconds: this), () {
      function();
    });
  }

  SizedBox horizontalSpace() => SizedBox(width: toDouble());

  SizedBox verticalSpace() => SizedBox(height: toDouble());

  dynamic loop(Function function) {
    for (var i = 0; i < this; i++) {
      function(i);
    }
  }

  EdgeInsets paddingLeft() {
    return EdgeInsets.only(left: toDouble());
  }

  EdgeInsets paddingTop() {
    return EdgeInsets.only(top: toDouble());
  }

  EdgeInsets paddingAll() {
    return EdgeInsets.all(toDouble());
  }

  EdgeInsets paddingRight() {
    return EdgeInsets.only(right: toDouble());
  }

  EdgeInsets paddingHorizontal() {
    return EdgeInsets.only(top: toDouble(), bottom: toDouble());
  }

  EdgeInsets paddingVertical() {
    return EdgeInsets.only(left: toDouble(), right: toDouble());
  }

  EdgeInsets marginAll() {
    return EdgeInsets.all(toDouble());
  }

  EdgeInsets marginLeft() {
    return EdgeInsets.only(left: toDouble());
  }

  EdgeInsets marginTop() {
    return EdgeInsets.only(top: toDouble());
  }

  EdgeInsets marginRight() {
    return EdgeInsets.only(right: toDouble());
  }

  EdgeInsets marginHorizontal() {
    return EdgeInsets.only(top: toDouble(), bottom: toDouble());
  }

  EdgeInsets marginVertical() {
    return EdgeInsets.only(left: toDouble(), right: toDouble());
  }

  EdgeInsets paddingOnly({
    required double top,
    required double bottom,
  }) {
    return EdgeInsets.only(
      right: toDouble(),
      left: toDouble(),
      top: top,
      bottom: bottom,
    );
  }

  EdgeInsets marginOnly({
    required double top,
    required double bottom,
  }) {
    return EdgeInsets.only(
      right: toDouble(),
      left: toDouble(),
      top: top,
      bottom: bottom,
    );
  }
}
