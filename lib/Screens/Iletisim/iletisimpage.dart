import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class IletisimPage extends StatefulWidget {
  @override
  IletisimPageState createState() => IletisimPageState();
}

class IletisimPageState extends State<IletisimPage> {
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
      appBar: AppBar(title: Text('İletişim'),),
      body:  Stack(
        children: [
          InAppWebView(
          initialUrlRequest: URLRequest(
              url: Uri.parse("https://content.fanteziturkiyelig.com/iletisim.html")
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