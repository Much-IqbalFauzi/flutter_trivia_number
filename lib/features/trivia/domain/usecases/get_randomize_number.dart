import 'package:dartz/dartz.dart';
import 'package:randomize_trivia/core/error/failures.dart';
import 'package:randomize_trivia/core/usecases/usecase.dart';
import 'package:randomize_trivia/features/trivia/domain/entities/trivia.dart';
import 'package:randomize_trivia/features/trivia/domain/repositories/trivia_repo.dart';

class GetRandomizeNumber implements UseCase<Trivia, NoParams> {
  final TriviaRepo repository;

  GetRandomizeNumber(this.repository);

  @override
  Future<Either<Failure, Trivia>> call(NoParams params) async {
    return await repository.getRandomNumber();
  }
}
