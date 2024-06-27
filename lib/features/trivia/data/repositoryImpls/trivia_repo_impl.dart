import 'package:dartz/dartz.dart';
import 'package:randomize_trivia/core/error/exceptions.dart';
import 'package:randomize_trivia/core/error/failures.dart';
import 'package:randomize_trivia/core/platform/network_info.dart';
import 'package:randomize_trivia/features/trivia/data/datasource/trivia_local.dart';
import 'package:randomize_trivia/features/trivia/data/datasource/trivia_remote.dart';
import 'package:randomize_trivia/features/trivia/domain/entities/trivia.dart';
import 'package:randomize_trivia/features/trivia/domain/repositories/trivia_repo.dart';

typedef _GetTriviaChooser = Future<Trivia> Function();

class TriviaRepoImpl implements TriviaRepo {
  final TriviaRemoteDatasource triviaRemote;
  final TriviaLocalDatasource triviaLocal;
  final NetworkInfo netInfo;

  TriviaRepoImpl(
      {required this.triviaRemote,
      required this.triviaLocal,
      required this.netInfo});

  @override
  Future<Either<Failure, Trivia>> getConcreteNumber(int number) async {
    return await _getTrivia(() => triviaRemote.getConcreteNumber(number));
  }

  @override
  Future<Either<Failure, Trivia>> getRandomNumber() async {
    return await _getTrivia(() => triviaRemote.getRandomNumber());
  }

  Future<Either<Failure, Trivia>> _getTrivia(
      _GetTriviaChooser getTrivia) async {
    if (await netInfo.isConnected) {
      try {
        final data = await getTrivia();
        return Right(data);
      } on ServerException {
        return const Left(ServerFailure("404"));
      }
    } else {
      try {
        final localData = await triviaLocal.getLastTrivia();
        return Right(localData);
      } on CacheException {
        return const Left(CacheFailure("404"));
      }
    }
  }
}
