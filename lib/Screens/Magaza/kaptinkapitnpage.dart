import 'dart:async';
import 'dart:io';
import 'package:fantasysuperlig/Screens/MenuPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KaptinKaptinPage extends StatefulWidget {
  @override
  KaptinKaptinPageState createState() => KaptinKaptinPageState();
}

class KaptinKaptinPageState extends State<KaptinKaptinPage> {
  double _progress=0;
  InAppWebViewController webView;
  GlobalKey<ScaffoldState> scaffoldKey=GlobalKey<ScaffoldState>();
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

    return WillPopScope(
      onWillPop: () {
        Navigator.push(context, MaterialPageRoute(builder: (context )=>MenuPage()));
      },
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(title: Text('KaptınKaptın.net'),leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context )=>MenuPage()));
        },),),
        body:  Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(
                    url: Uri.parse("https://www.kaptinkaptin.net/fantezi-turkiye-lig")
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
      ),
    );
  }
}