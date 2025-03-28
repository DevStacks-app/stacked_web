import 'package:flutter/material.dart';
import 'package:stacked_web/stacked_web.dart';

class WebWindow extends StatefulWidget {
  const WebWindow({super.key, required this.url});

  final String url;

  @override
  State<WebWindow> createState() => _WebWindowState();
}

class _WebWindowState extends State<WebWindow> {
  WebEngine? _engine;

  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _offset.dy,
      left: _offset.dx,
      width: 400,
      height: 400,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Listener(
            onPointerMove: (event) {
              setState(() => _offset += event.delta);
            },
            child: Container(
              padding: EdgeInsets.all(16),
              height: 64,
              width: double.infinity,
              color: Colors.blue,
              child: Text('${widget.url} (${_engine.hashCode})'),
            ),
          ),
          Flexible(
            child: WebView(
              url: widget.url,
              onEngineAttached: (engine) => setState(() => _engine = engine),
            ),
          ),
        ],
      ),
    );
  }
}
