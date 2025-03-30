import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:stacked_web/src/inapp/inapp.dart';
import 'package:stacked_web/stacked_web.dart';

/// {@template inapp_web_engine_state}
/// The [WebViewState] implementation for `pkg:flutter_inappwebview`.
/// {@endtemplate}
class InappWebViewState extends WebViewState<InappWebEngine> {
  late final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      key: _key,
      initialSettings: InAppWebViewSettings(
        javaScriptEnabled: widget.mode == JsMode.enabled,
      ),
      initialUrlRequest: URLRequest(url: WebUri(widget.url)),
      onWebViewCreated: (controller) => attach(InappWebEngine(controller)),
      // TODO(wolfen): these should give us access to the loading state of a page
      onLoadStart: (controller, url) {},
      onProgressChanged: (controller, progress) {},
      onLoadStop: (controller, url) {},
    );
  }
}
