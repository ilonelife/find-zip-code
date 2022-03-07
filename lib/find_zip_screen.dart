import 'dart:convert';
import 'dart:io';

import 'package:findzipcode/zip_code.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FindZipScreen extends StatefulWidget {
  const FindZipScreen({Key? key}) : super(key: key);

  @override
  State<FindZipScreen> createState() => _FindZipScreenState();
}

class _FindZipScreenState extends State<FindZipScreen> {
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('...'),
      ),
      body: WebView(
        // initialUrl: 'http://127.0.0.1:5500/index.html',
        // initialUrl: 'http://10.0.2.2:5500/index.html',
        // initialUrl: 'http://192.168.0.83:5500/index.html',
        // initialUrl: 'https://flutter.dev',
        initialUrl: 'https://ilonelife.github.io/find-zip-code/',
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: {
          JavascriptChannel(
            name: 'zipcode',
            onMessageReceived: (JavascriptMessage message) {
              Map<String, dynamic> json = jsonDecode(message.message);
              //       print(json);

              ZipCode zipCode = ZipCode.fromJson(json);
              //  호출한 화면으로 결과를 전달한다
              Navigator.pop(context, zipCode);
            },
          ),
        },
      ),
    );
  }
}
