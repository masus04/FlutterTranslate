import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'providers/_providers.dart';

/// The main view of the application, showing translations
class TranslateView extends StatelessWidget {
  // ignore: public_member_api_docs
  const TranslateView({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FlutterTranslate'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(25),
              padding: const EdgeInsets.all(25),
              width: 1000,
              height: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  const _InputText(
                    key: Key('TranslateInput'),
                  ),
                  const _InputTextButtons(key: Key('InputButtons')),
                  const _OutputText(
                    key: Key('TranslateOutput'),
                  )
                ],
              ),
            ),
            const Spacer(),
          ],
        ));
  }
}

class _InputText extends HookWidget {
  const _InputText({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TextField(
        maxLines: null,
        expands: true,
        keyboardType: TextInputType.multiline,
      ),
    );
  }
}

class _OutputText extends HookWidget {
  const _OutputText({required Key key}) : super(key: key);

  static const annotationColors = {
    AnnotationType.none: Colors.blueGrey,
    AnnotationType.alternative: Colors.orange,
    AnnotationType.unconventional: Colors.red
  };

  @override
  Widget build(BuildContext context) {
    final annotatedText = useProvider(textAnnotationProvider);

    return Expanded(
      child: annotatedText.when(
        data: (annotatedText) => SelectableText.rich(
          TextSpan(
            children: annotatedText.textSegments
                .map((segment) => TextSpan(
                    text: segment.text,
                    style: TextStyle(
                        fontSize: 18,
                        color: annotationColors[segment.annotation.type])))
                .toList(),
          ),
        ),
        loading: () => const Center(
          child: SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(),
          ),
        ),
        error: (err, stack) => const Text('Translation could not be retrieved'),
      ),
    );
  }
}

class _InputTextButtons extends StatelessWidget {
  const _InputTextButtons({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(onPressed: () {}, child: const Text('Edit')),
        const SizedBox(
          width: 10,
        ),
        TextButton(onPressed: () {}, child: const Text('Translate'))
      ],
    );
  }
}
