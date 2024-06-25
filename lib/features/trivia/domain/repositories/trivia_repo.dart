import 'package:dartz/dartz.dart';
import 'package:randomize_trivia/core/error/failures.dart';
import 'package:randomize_trivia/features/trivia/domain/entities/trivia.dart';

abstract class TriviaRepo {
  Future<Either<Failure, Trivia>> getConcreteNumber(int number);

  Future<Either<Failure, Trivia>> getRandomNumber();
}
