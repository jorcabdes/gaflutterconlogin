import 'package:dartz/dartz.dart';
import 'package:gaflutter/core/failure.dart';
import 'package:gaflutter/core/usecase.dart';
import 'package:gaflutter/domain/entities/comarca.dart';
import 'package:gaflutter/domain/repositories/comarca_repository.dart';

class UpdateTask implements UseCase<void, ComarcaEntity> {
  final TaskRepository repository;

  UpdateTask(this.repository);

  @override
  Future<Either<Failure, void>> call(ComarcaEntity task) {
    return repository.updateTask(task);
  }
}
