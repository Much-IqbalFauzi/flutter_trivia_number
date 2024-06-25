import 'package:equatable/equatable.dart';

class Trivia extends Equatable {
  final String text;
  final int number;
  final bool found;

  const Trivia({required this.text, required this.number, required this.found})
      : super();

  @override
  List<Object?> get props => [text, number, found];
}
