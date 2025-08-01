// bloc/worker_event.dart
part of 'matchmaking_bloc.dart';

@immutable
sealed class WorkerEvent {}

class LoadInitialWorkerEvent extends WorkerEvent {}

class LoadNextWorkerEvent extends WorkerEvent {}

class ViewWorkerDetailEvent extends WorkerEvent {
  final Worker worker;

  ViewWorkerDetailEvent(this.worker);
}