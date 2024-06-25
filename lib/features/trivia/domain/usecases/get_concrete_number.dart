import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:randomize_trivia/core/error/failures.dart';
import 'package:randomize_trivia/core/usecases/usecase.dart';
import 'package:randomize_trivia/features/trivia/domain/entities/trivia.dart';
import 'package:randomize_trivia/features/trivia/domain/repositories/trivia_repo.dart';

class GetConcreteNumber implements UseCase<Trivia, Params> {
  final TriviaRepo repository;

  GetConcreteNumber(this.repository);

  @override
  Future<Either<Failure, Trivia>> call(Params params) async {
    return await repository.getConcreteNumber(params.number);
  }
}

class Params extends Equatable {
  final int number;

  const Params({required this.number});

  @override
  List<Object?> get props => [number];
}
