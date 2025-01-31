import 'data/datasources/task_remote_datasource.dart';
import 'usecases/add_comarca_use_case.dart';
import 'usecases/delete_comarca_use_case.dart';
import 'usecases/get_comarca_by_id.dart';
import 'usecases/get_comarca_use_case.dart';
import 'usecases/stream_comarca_use_case%20copy.dart';
import 'usecases/update_comarca_use_case.dart';
import 'blocs/tasks/tasks_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_database/firebase_database.dart';
import 'data/repositories/task_repository_impl.dart';
import 'domain/repositories/comarca_repository.dart';

final getIt = GetIt.instance;

void injectDependencies() {
  // Firebase Realtime Database
  getIt
      .registerLazySingleton<FirebaseDatabase>(() => FirebaseDatabase.instance);

  // Data Sources
  getIt.registerLazySingleton<TaskRemoteDataSource>(
      () => TaskRemoteDataSourceImpl(getIt<FirebaseDatabase>()));

  // Repositories
  getIt.registerLazySingleton<TaskRepository>(
      () => TaskRepositoryImpl(getIt<TaskRemoteDataSource>()));

  // Use Cases
  getIt.registerLazySingleton(() => GetTasks(getIt<TaskRepository>()));
  getIt.registerLazySingleton(() => AddTask(getIt<TaskRepository>()));
  getIt.registerLazySingleton(() => UpdateTask(getIt<TaskRepository>()));
  getIt.registerLazySingleton(() => DeleteTask(getIt<TaskRepository>()));
  getIt.registerLazySingleton(() => GetTaskById(getIt<TaskRepository>()));
  getIt.registerLazySingleton(() => StreamTasks(getIt<TaskRepository>()));

  // Bloc
  getIt.registerFactory(() => TasksBloc(
        getTasks: getIt<GetTasks>(),
        addTask: getIt<AddTask>(),
        updateTask: getIt<UpdateTask>(),
        deleteTask: getIt<DeleteTask>(),
        getTaskById: getIt<GetTaskById>(),
        streamTasks: getIt<StreamTasks>(),
      ));
}
