// ignore_for_file: constant_identifier_names

import 'dart:math';

import 'package:academic_master/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

/// Reference from Chrome responsive layout
class PageBreakpoint {
  static const double MOBILE_MIN = 0;
  static const double MOBILE_MAX = 425;
  static const double TABLET_MIN = 426;
  static const double TABLET_MAX = 768;
  static const double DESKTOP_MIN = 769;
  static const double DESKTOP_MAX = 1920;
  static const double UHD_MIN = 1921;
  static const double UHD_MAX = 1440;
  static const double BEYOND_UHD_MIN = 1440;
  static const double MAX = double.maxFinite;
}

/// A responsive widget to be used as a wrapper for pages

class Responsive extends StatelessWidget {
  const Responsive({
    required this.child,
    this.backgroundColor = Apptheme.backgroundColor,
    this.maxWidth,
    this.border = false,
    this.maxHeight,
    super.key,
  });
  final Widget child;

  final Color backgroundColor;
  final double? maxWidth;
  final bool border;
  final double? maxHeight;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: max(
          maxWidth ?? PageBreakpoint.TABLET_MAX,
          PageBreakpoint.MOBILE_MAX,
        ),
        minWidth: PageBreakpoint.MOBILE_MAX,
      ),
      child: child,
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveLayout({
    required this.mobile,
    required this.tablet,
    required this.desktop,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext layoutBuilderContext, BoxConstraints constraints) {
        final double screenWidth = constraints.maxWidth;
        if (screenWidth <= PageBreakpoint.MOBILE_MAX) {
          return mobile;
        } else if (screenWidth <= PageBreakpoint.TABLET_MAX) {
          return tablet;
        } else {
          return desktop;
        }
      },
    );
  }
}
