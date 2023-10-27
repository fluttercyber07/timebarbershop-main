import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../constants.dart';

class OrderOnlineScreen extends StatefulWidget {
  const OrderOnlineScreen({super.key});

  @override
  State<OrderOnlineScreen> createState() => _OrderOnlineScreenState();
}

class _OrderOnlineScreenState extends State<OrderOnlineScreen> {
  bool isLoading = true;

  final _key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: WebView(
                key: _key,
                backgroundColor: Colors.white,
                allowsInlineMediaPlayback: true,
                onPageFinished: (finish) {
                  // FlutterNativeSplash.remove();
                  setState(() {
                    isLoading = false;
                  });
                },
                zoomEnabled: false,
                initialMediaPlaybackPolicy:
                    AutoMediaPlaybackPolicy.always_allow,
                initialUrl: 'https://n773195.alteg.io/company:726327#1',
                javascriptMode: JavascriptMode.unrestricted,
                gestureRecognizers: Set()
                  ..add(
                    Factory<DragGestureRecognizer>(
                      () => VerticalDragGestureRecognizer(),
                    ),
                  ),
              ),
            ),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(color: ColorManager.red),
                  )
                : Stack()
          ],
        ),
      ),
    );
  }
}
