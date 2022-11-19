import 'package:academic_master/presentation/theme/theme.dart';
import 'package:academic_master/presentation/utils/asset_path.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PostDeleteConfirmatationPopup extends StatelessWidget {
  String message;
  PostDeleteConfirmatationPopup({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Align(
      child: Container(
        height: 150,
        // width: 320,
        // ignore: sort_child_properties_last
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              child: GestureDetector(
                onTap: () {
                  AutoRouter.of(context).pop();
                },
                child: Container(
                  height: 25,
                  // width: 20,
                  alignment: Alignment.topRight,
                  child: Image(
                    image: AssetImage(closeIcon),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: Apptheme(context).boldText.copyWith(
                      color: Apptheme.primaryColor,
                      fontSize: 20,
                      decoration: TextDecoration.none,
                    ),
              ),
            ),
            const SizedBox(width: 150),
          ],
        ),
        margin: const EdgeInsets.only(bottom: 50, left: 12, right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
