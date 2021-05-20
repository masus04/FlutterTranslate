import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_translate/views/_views.dart';

void main() {
  runApp(FlutterTranslate());
}

/// A flutter app providing a translation Frontend
class FlutterTranslate extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TranslateView(key: Key('TranslateView'),),
      ),
    );
  }
}
