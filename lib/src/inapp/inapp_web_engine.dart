import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:stacked_web/stacked_web.dart';

/// {@template inapp_web_engine}
/// The [WebEngine] implementation for `pkg:flutter_inappwebview`.
/// {@endtemplate}
class InappWebEngine implements WebEngine {
  /// {@macro inapp_web_engine}
  InappWebEngine(this._controller);

  final InAppWebViewController _controller;

  @override
  Future<T> eval<T>(String code) async {
    final result = await _controller.evaluateJavascript(
      source: code,
      contentWorld: ContentWorld.PAGE,
    );
    return result as T;
  }

  @override
  Future<T> callMethod<T>(String name, List<dynamic> arguments) async {
    final result = await _controller.callAsyncJavaScript(
      functionBody: 'return $name(...args);',
      arguments: {'args': arguments},
      contentWorld: ContentWorld.PAGE,
    );
    return result?.value as T;
  }
}
