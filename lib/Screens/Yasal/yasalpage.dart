import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class YasalPage extends StatefulWidget {
  @override
  YasalPageState createState() => YasalPageState();
}

class YasalPageState extends State<YasalPage> {
  double _progress=0;
  InAppWebViewController webView;
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.

    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Yasal'),),
      body:  Stack(
        children: [
          InAppWebView(
          initialUrlRequest: URLRequest(
              url: Uri.parse("https://content.fanteziturkiyelig.com/yasal.html")
          ),
          onWebViewCreated: (InAppWebViewController controller){
            webView=controller;
          },
          onProgressChanged: (InAppWebViewController controller,int progress){
            setState(() {
              _progress=progress/100;
            });
          },
          onReceivedServerTrustAuthRequest: (controller, challenge) async {
            print(challenge);
            return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
          },
        ),
          _progress<1?Center(child: CircularProgressIndicator()):SizedBox()
        ]
      ),
    );
  }
}