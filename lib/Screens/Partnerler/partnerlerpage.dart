import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PartnerlerPage extends StatefulWidget {
  @override
  PartnerlerPageState createState() => PartnerlerPageState();
}

class PartnerlerPageState extends State<PartnerlerPage> {
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
      appBar: AppBar(title: Text('Youtube'),),
      body:  InAppWebView(
        initialUrlRequest: URLRequest(
           // url: Uri.parse("https://content.fanteziturkiyelig.com/partnerler.html")
            url: Uri.parse("https://www.youtube.com")
        ),
        onReceivedServerTrustAuthRequest: (controller, challenge) async {
          print(challenge);
          return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
        },
      ),
    );
  }
}