import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:timebarbershop/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChooseBranchScreen extends StatefulWidget {
  const ChooseBranchScreen({super.key});

  @override
  State<ChooseBranchScreen> createState() => _ChooseBranchScreenState();
}

class _ChooseBranchScreenState extends State<ChooseBranchScreen> {
  bool isLoading = true;

  final _key = UniqueKey();
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: WebView(
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
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
                initialUrl: 'https://n773195.alteg.io/group:711675/city:all#1',
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
