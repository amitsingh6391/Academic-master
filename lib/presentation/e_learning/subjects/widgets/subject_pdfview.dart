import 'package:academic_master/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';

import 'package:webview_flutter/webview_flutter.dart';

class SubjectPdfView extends HookWidget {
  final String url;
  const SubjectPdfView(this.url);

  @override
  Widget build(BuildContext context) {
    final loading = useState(0);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            WebView(
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
              onProgress: (int progress) {
                loading.value = progress;
              },
              gestureNavigationEnabled: true,
            ),
            if (loading.value < 100)
              Positioned(
                top: MediaQuery.of(context).size.height / 5,
                left: MediaQuery.of(context).size.width / 5,
                child: Column(
                  children: [
                    Lottie.asset(
                      "assets/lottiefiles/searching.json",
                      height: 400,
                      width: 300,
                    ),
                    Text(
                      "Loding.... ${loading.value}  % ",
                      style: Apptheme(context).boldText.copyWith(
                            fontSize: 20,
                          ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
