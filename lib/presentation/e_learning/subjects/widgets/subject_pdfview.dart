import 'package:academic_master/presentation/theme/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class SubjectPdfView extends HookWidget {
  final String url;
  const SubjectPdfView(this.url);

  @override
  Widget build(BuildContext context) {
    final loading = useState(0);

    final webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            loading.value = progress;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            WebViewWidget(
              controller: webViewController,
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
