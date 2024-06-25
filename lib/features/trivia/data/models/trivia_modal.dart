import 'package:randomize_trivia/features/trivia/domain/entities/trivia.dart';

class TriviaModal extends Trivia {
  const TriviaModal(
      {required String text, required int number, required bool found})
      : super(text: text, number: number, found: found);

  factory TriviaModal.fromJson(Map<String, dynamic> json) {
    return TriviaModal(
        text: json['text'],
        number: (json['number'] as num).toInt(),
        found: json['found']);
  }

  Map<String, dynamic> toJaon() {
    return {'text': text, 'number': number};
  }
}
