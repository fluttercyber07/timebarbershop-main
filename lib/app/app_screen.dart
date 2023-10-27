import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading = true;

  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // backgroundColor: Colors.white,
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
                initialUrl: 'https://boyin-food.uz/',
                // initialUrl: 'https://rasta.uz/',
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
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : Stack()
          ],
        ),
      ),
    );
  }
  // ? Image.asset(
  //     'assets/splash.png',
  //   )
}
