import 'package:dartz/dartz.dart';
import 'package:gaflutter/core/failure.dart';
import 'package:gaflutter/core/usecase.dart';
import 'package:gaflutter/domain/entities/comarca.dart';
import 'package:gaflutter/domain/repositories/comarca_repository.dart';

class GetTaskById implements UseCase<ComarcaEntity, String> {
  final TaskRepository repository;

  GetTaskById(this.repository);

  @override
  Future<Either<Failure, ComarcaEntity>> call(String taskId) {
    return repository.getTaskById(taskId);
  }
}
