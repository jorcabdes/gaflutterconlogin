import 'package:dartz/dartz.dart';
import 'package:gaflutter/core/failure.dart';
import 'package:gaflutter/core/usecase.dart';
import 'package:gaflutter/domain/entities/comarca.dart';
import 'package:gaflutter/domain/repositories/comarca_repository.dart';

class StreamTasks {
  final TaskRepository repository;

  StreamTasks(this.repository);

  Either<Failure, Stream<List<ComarcaEntity>>> call(NoParams params) {
    return repository.streamTasks();
  }
}
