import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:glossy_flossy/utils/app_constants.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:webview_flutter_x5/webview_flutter.dart';

class PaypalPayment extends StatelessWidget {
  final int amount;
  const PaypalPayment({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.GLOSSY_FLOSSY_BLACK,
      appBar: AppBar(
        backgroundColor: ColorResources.GLOSSY_FLOSSY_BLACK,
        automaticallyImplyLeading: true,
      ),
      body: WebView(
        initialUrl: AppConstants.BASE_URL,
        javascriptMode: JavascriptMode.unrestricted,
        gestureRecognizers: Set()..add(Factory<DragGestureRecognizer>(
          () => VerticalDragGestureRecognizer())),
          onPageFinished: (value) {
            print(value);
          },
          navigationDelegate: (NavigationRequest request) async {
          if (request.url.contains('http://return_url/?status=success')) {
            print('return url on success');
            Navigator.pop(context);
          }
          if (request.url.contains('http://cancel_url')) {
            Navigator.pop(context);
          }
          return NavigationDecision.navigate;
        },
      )
    );
  }
}