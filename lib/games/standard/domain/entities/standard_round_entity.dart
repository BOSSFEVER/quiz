class StandardRoundEntity {
  StandardRoundEntity({this.shorthand = '', this.question = '', this.answer = '', this.extra = ''});

  final String shorthand;
  final String question;
  final String answer;
  final String extra;

  @override
  String toString() {
    return 'StandardRoundEntity[$shorthand, $question, $answer, $extra]';
  }
}
