import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FindLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      "assets/lottiefiles/searching.json",
      height: 400,
      width: 300,
    );
  }
}

class CircleLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      "assets/lottiefiles/loading.json",
      width: 100,
      height: 100,
    );
  }
}
