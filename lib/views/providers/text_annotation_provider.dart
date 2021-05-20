import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A Future Provider fetching some annotated text
final textAnnotationProvider = FutureProvider<AnnotatedText>( (ProviderReference ref) {
  return Future.delayed( const Duration(seconds: 2), () {
    return dummyText;
  }, );
});

final AnnotatedText dummyText = AnnotatedText([
  TextSegment('It was a ', TextAnnotation(AnnotationType.none, [])),
  TextSegment('slippery ', TextAnnotation(AnnotationType.alternative, ['slick'])),
  TextSegment('road ', TextAnnotation(AnnotationType.alternative, ['street'])),
  TextSegment('and he was ', TextAnnotation(AnnotationType.none, [])),
  TextSegment('willing ', TextAnnotation(AnnotationType.alternative, ['able'])),
  TextSegment('to slide all the way to the deepest ', TextAnnotation(AnnotationType.none, [])),
  TextSegment('depths ', TextAnnotation(AnnotationType.unconventional, ['point of the path'])),
]);

class AnnotatedText {
  List<TextSegment> textSegments;
  AnnotatedText(this.textSegments);
}

class TextSegment {
  String text;
  TextAnnotation annotation;

  TextSegment(this.text, this.annotation);
}

class TextAnnotation {
  AnnotationType type;
  List<String> alternatives;

  TextAnnotation(this.type, this.alternatives);
}

enum AnnotationType {
  none,
  alternative,
  unconventional
}
