import 'package:academic_master/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

/// Reference from Chrome responsive layout
class PageBreakpoint {
  static const double mobileS = 320;
  static const double mobileM = 375;
  static const double mobile = 425;
  static const double tablet = 768;
  static const double daskTop = 768;
  static const double deskTopL = 1440;
  static const double deskTopXl = 2560;
}

/// A responsive widget to be used as a wrapper for pages
///
class Responsive extends StatelessWidget {
  const Responsive({
    required this.child,
    this.backgroundColor = Apptheme.backgroundColor,
    this.maxWidth,
    super.key,
  });
  final Widget child;
  final Color backgroundColor;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.builder(
      child,
      maxWidth: maxWidth ?? PageBreakpoint.tablet,
      minWidth: PageBreakpoint.mobile,
      defaultScale: true,
      breakpoints: const [
        ResponsiveBreakpoint.autoScaleDown(400),
        ResponsiveBreakpoint.resize(
          PageBreakpoint.mobile,
          name: MOBILE,
        ),
        ResponsiveBreakpoint.resize(
          PageBreakpoint.tablet,
          name: TABLET,
        ),
        ResponsiveBreakpoint.resize(
          PageBreakpoint.tablet,
          name: DESKTOP,
        ),
      ],
      background: ColoredBox(color: backgroundColor),
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
        if (screenWidth <= PageBreakpoint.mobile) {
          return mobile;
        } else if (screenWidth <= PageBreakpoint.tablet) {
          return tablet;
        } else {
          return desktop;
        }
      },
    );
  }
}
