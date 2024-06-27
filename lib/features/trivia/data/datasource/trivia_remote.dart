import 'package:randomize_trivia/features/trivia/data/models/trivia_modal.dart';

abstract class TriviaRemoteDatasource {
  Future<TriviaModal> getConcreteNumber(int number);

  Future<TriviaModal> getRandomNumber();
}
