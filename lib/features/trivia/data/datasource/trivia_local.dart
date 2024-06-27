import 'package:randomize_trivia/features/trivia/data/models/trivia_modal.dart';

abstract class TriviaLocalDatasource {
  Future<TriviaModal> getLastTrivia();
  Future<void> setCacheTrivia(TriviaModal trivia);
}
