import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// MARK: - Stateful widget

class WebViewScreen extends StatelessWidget {
  final String url;

  const WebViewScreen({
    Key key,
    @required this.url
  }): assert(url != null),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}