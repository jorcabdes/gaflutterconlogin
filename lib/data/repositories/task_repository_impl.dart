import 'package:dartz/dartz.dart';
import 'package:gaflutter/core/failure.dart';
import 'package:gaflutter/data/datasources/task_remote_datasource.dart';
import 'package:gaflutter/data/models/comarca_model.dart';
import 'package:gaflutter/domain/entities/comarca.dart';
import 'package:gaflutter/domain/repositories/comarca_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource remoteDataSource;

  TaskRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<ComarcaEntity>>> getTasks() async {
    try {
      final taskModels = await remoteDataSource.getTasks();
      final taskEntities = taskModels.map((taskModel) {
        return taskModel.toEntity();
      }).toList();
      return Right(taskEntities);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Stream<List<ComarcaEntity>>> streamTasks() {
    try {
      Stream<List<TaskModel>> taskModels = remoteDataSource.streamTasks();
      Stream<List<ComarcaEntity>> taskEntities = taskModels.map((taskModelList) {
        return taskModelList.map((taskModel) => taskModel.toEntity()).toList();
      });
      return Right(taskEntities);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ComarcaEntity>> getTaskById(String taskId) async {
    try {
      final task = await remoteDataSource.getTaskById(taskId);
      if (task != null) return Right(task.toEntity());
      return Left(ServerFailure());
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addTask(ComarcaEntity task) async {
    try {
      await remoteDataSource.addTask(TaskModel.fromEntity(task));
      return const Right(null);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateTask(ComarcaEntity task) async {
    try {
      await remoteDataSource.updateTask(TaskModel.fromEntity(task));
      return const Right(null);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteTask(String taskId) async {
    try {
      await remoteDataSource.deleteTask(taskId);
      return const Right(null);
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}
