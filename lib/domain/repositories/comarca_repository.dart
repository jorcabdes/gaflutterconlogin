import 'package:dartz/dartz.dart';
import 'package:gaflutter/core/failure.dart';
import 'package:gaflutter/domain/entities/comarca.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<ComarcaEntity>>> getTasks();

  Either<Failure, Stream<List<ComarcaEntity>>> streamTasks();

  Future<Either<Failure, ComarcaEntity>> getTaskById(String taskId);

  Future<Either<Failure, void>> addTask(ComarcaEntity task);

  Future<Either<Failure, void>> updateTask(ComarcaEntity task);

  Future<Either<Failure, void>> deleteTask(String taskId);
}
