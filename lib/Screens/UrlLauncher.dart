import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UrLauntcher extends StatefulWidget {
   UrLauntcher({Key? key,required this.url}) : super(key: key);
  String url;

  @override
  State<UrLauntcher> createState() => _UrLauntcherState();
}

class _UrLauntcherState extends State<UrLauntcher> {

  var loadingPercentage = 0;
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(body:   Stack(
      children: [
        Container(child:  WebView(
          onWebViewCreated: (c){
          // widget.controller=c;
        },
          javascriptMode:JavascriptMode.unrestricted ,
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          initialUrl: widget.url,
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },

        )),
        if (loadingPercentage < 100)
          LinearProgressIndicator(color: Colors.orange,minHeight: 5,backgroundColor: Colors.white,
            value: loadingPercentage / 100.0,
          ),
      ],
    ),);
  }
}


class UrLauntcher_ extends StatefulWidget {
  UrLauntcher_({Key? key,required this.url}) : super(key: key);
  String url;

  @override
  State<UrLauntcher_> createState() => _UrLauntcher_State();
}

class _UrLauntcher_State extends State<UrLauntcher_> {

  var loadingPercentage = 0;
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(body:   Stack(
      children: [
        Container(child:  WebView(onWebViewCreated: (c){
          // widget.controller=c;
        },
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          javascriptMode:JavascriptMode.unrestricted ,

          initialUrl: widget.url,
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },

        )),
        if (loadingPercentage < 100)
          LinearProgressIndicator(color: Colors.orange,minHeight: 5,backgroundColor: Colors.white,
            value: loadingPercentage / 100.0,
          ),
      ],
    ),);
  }
}



class UrLauntcher_2 extends StatefulWidget {
  UrLauntcher_2({Key? key,required this.url}) : super(key: key);
  String url;

  @override
  _UrLauntcher2_State createState() => _UrLauntcher2_State();
}

class _UrLauntcher2_State extends State<UrLauntcher_2> {

  var loadingPercentage = 0;
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(body:   Stack(
      children: [
        Container(child:  WebView(
          onWebViewCreated: (c){
          // widget.controller=c;
        },javascriptMode:JavascriptMode.unrestricted ,
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },

          initialUrl: widget.url,
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },

        )),
        if (loadingPercentage < 100)
          LinearProgressIndicator(color: Colors.orange,minHeight: 5,backgroundColor: Colors.white,
            value: loadingPercentage / 100.0,
          ),
      ],
    ),);
  }
}

class UrLauntcher_3 extends StatefulWidget {
  UrLauntcher_3({Key? key,required this.url}) : super(key: key);
  String url;

  @override
  _UrLauntcher_3State createState() => _UrLauntcher_3State();
}

class _UrLauntcher_3State extends State<UrLauntcher_3> {

  var loadingPercentage = 0;
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(body:   Stack(
      children: [
        Container(child:  WebView(onWebViewCreated: (c){
          // widget.controller=c;
        },
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          javascriptMode:JavascriptMode.unrestricted ,

          initialUrl: widget.url,
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },

        )),
        if (loadingPercentage < 100)
          LinearProgressIndicator(color: Colors.orange,minHeight: 5,backgroundColor: Colors.white,
            value: loadingPercentage / 100.0,
          ),
      ],
    ),);
  }
}

