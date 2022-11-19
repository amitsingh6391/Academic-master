// ignore_for_file: annotate_overrides, overridden_fields

import 'package:academic_master/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimatedCircle extends HookWidget {
  final String? title;
  final double height;
  final Color myCircleColor;
  final Key? key;
  const AnimatedCircle({
    this.title = "",
    this.key,
    this.height = 120.0,
    this.myCircleColor = Apptheme.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final myCircleHeight = useState(height);
    final myfinalCircleColor = useState(myCircleColor);

    return GestureDetector(
      onTap: () {},
      child: AnimatedContainer(
        height: myCircleHeight.value,
        duration: const Duration(seconds: 3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: myfinalCircleColor.value,
        ),
        child: Center(
          child: Text(
            title!,
            style: const TextStyle(fontFamily: "Circular", fontSize: 20),
          ),
        ),
      ),
    );
  }
}
