// bloc/worker_event.dart
part of 'worker_bloc.dart';

@immutable
sealed class WorkerEvent {}

class LoadNextWorkerEvent extends WorkerEvent {}

class ViewWorkerDetailEvent extends WorkerEvent {
  final Worker worker;

  ViewWorkerDetailEvent(this.worker);
}