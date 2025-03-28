import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked_web/src/inapp/inapp.dart';
import 'package:stacked_web/stacked_web.dart';

/// {@template web_view}
///  Web view widget for displaying any web content inside the widget tree.
/// {@endtemplate}
class WebView extends StatefulWidget {
  /// {@macro web_view}
  const WebView({required this.url, this.onEngineAttached, super.key});

  /// The initial URL to load.
  final String url;

  /// Optional call back for when a [WebEngine] get's attached.
  final ValueChanged<WebEngine>? onEngineAttached;

  @override
  State<StatefulWidget> createState() => WebViewState._();
}

/// {@template webview_state}
/// Basic state of a single webview, it's underlying implementation gets
/// determined based on which platform it is being run on.
/// {@endtemplate}
abstract class WebViewState<E extends WebEngine> extends State<WebView> {
  /// {@macro webview_state}
  WebViewState();

  factory WebViewState._() {
    if (kIsWeb) throw UnsupportedError('web');
    if (Platform.isAndroid) throw UnsupportedError('android');
    if (Platform.isLinux) throw UnsupportedError('linux');
    if (Platform.isFuchsia) throw UnsupportedError('fuchsia');

    return InappWebViewState() as WebViewState<E>;
  }

  /// The engine currently attached to the state.
  E? get engine => _engine;
  E? _engine;

  /// Called when an engine gets attached.
  void attach(E engine) => widget.onEngineAttached?.call(engine);
}
