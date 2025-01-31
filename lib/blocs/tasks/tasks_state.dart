import 'package:equatable/equatable.dart';
import '../../../domain/entities/comarca.dart';

class TasksState extends Equatable {
  final List<ComarcaEntity> tasks;
  final bool isLoading;
  final String? errorMessage;

  const TasksState({
    this.tasks = const <ComarcaEntity>[],
    this.isLoading = false,
    this.errorMessage,
  });

  TasksState copyWith({
    List<ComarcaEntity>? tasks,
    bool? isLoading,
    String? errorMessage,
  }) {
    return TasksState(
      tasks: tasks ?? this.tasks,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [tasks, isLoading, errorMessage];
}
