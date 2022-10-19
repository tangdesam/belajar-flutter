import 'package:flutter/material.dart';
import 'package:news_api/widgets/custom_scaffold.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MoreNewsScreen extends StatelessWidget {
  static const routeName = '/more_news';
  final String url;
  const MoreNewsScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: WebView(
        initialUrl: this.url,
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('More detail news'),
    //   ),
    //   body: WebView(
    //     initialUrl: this.url,
    //   ),
    // );
  }
}
 