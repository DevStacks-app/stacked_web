import 'package:example/web_window.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LayoutBuilder(builder: (context, constraints) {
          return Container(
            color: Colors.red,
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  WebWindow(url: 'https://google.com'),
                  WebWindow(
                    url:
                        'https://zapp.run/edit/flutter?lazy=false&split=50&entry=lib/main.dart&file=lib/main.dart',
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
