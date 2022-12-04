import 'package:flutter/material.dart';

class RotationFadeTransitionBuilder extends PageTransitionsBuilder {
  const RotationFadeTransitionBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return _RotationFadeTransitionBuilder(
      routeAnimation: animation,
      child: child,
    );
  }
}

class _RotationFadeTransitionBuilder extends StatelessWidget {
  _RotationFadeTransitionBuilder({
    required Animation<double> routeAnimation,
    required this.child,
  })  : _turnsAnimation = routeAnimation.drive(_linearToEaseOut),
        _opacityAnimation = routeAnimation.drive(_easeInTween);

  static final Animatable<double> _linearToEaseOut =
      CurveTween(curve: Curves.linearToEaseOut);
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);

  final Animation<double> _turnsAnimation;
  final Animation<double> _opacityAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _turnsAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: child,
      ),
    );
  }
}
