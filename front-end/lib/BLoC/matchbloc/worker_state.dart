// bloc/worker_state.dart
part of 'worker_bloc.dart';

@immutable
sealed class WorkerState {}

final class WorkerInitial extends WorkerState {}

final class WorkerLoading extends WorkerState {}

final class WorkerLoaded extends WorkerState {
  final Worker currentWorker;

  WorkerLoaded(this.currentWorker);
}

final class WorkerError extends WorkerState {
  final String message;

  WorkerError(this.message);
}