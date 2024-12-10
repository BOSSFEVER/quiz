class StandardRoundEntity {
  StandardRoundEntity({this.shorthand = '', this.question = '', this.answer = '', this.extra = ''});

  final String shorthand;
  final String question;
  final String answer;
  final String extra;

  StandardRoundEntity copyWith({String? shorthand, String? question, String? answer, String? extra}) {
    return StandardRoundEntity(
      shorthand: shorthand ?? this.shorthand,
      question: question ?? this.question,
      answer: answer ?? this.answer,
      extra: extra ?? this.extra,
    );
  }

  @override
  String toString() {
    return 'StandardRoundEntity[$shorthand, $question, $answer, $extra]';
  }
}
