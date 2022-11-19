import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

dynamic customDialog(
  BuildContext context, {
  required Function onDismiss,
  Widget widget = const Text('Pass sub widgets'),
}) async {
  await showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    transitionDuration: const Duration(milliseconds: 500),
    context: context,
    pageBuilder: (_, __, ___) {
      return Align(child: widget);
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position:
            Tween(begin: const Offset(-3, 0), end: Offset.zero).animate(anim),
        child: child,
      );
    },
  );
}

Future<void> openUrl(String url) async {
  if (await canLaunchUrl(
    Uri.parse(url),
  )) {
    launchUrl(
      Uri.parse(url),
    );
  }
}

Future<void> sharelink() async {
  try {
    Share.share(
      'Academic master is a fastest growing educational app for students, play store link: https://play.google.com/store/apps/details?id=com.academic.master',
      subject: '.',
    );
  } catch (e) {
    debugPrint('error: $e');
  }
}
