part of 'detail_bloc.dart';

abstract class WorkerDetailEvent extends Equatable {
  const WorkerDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadWorkerDetail extends WorkerDetailEvent {
  final String workerId;

  const LoadWorkerDetail(this.workerId);

  @override
  List<Object> get props => [workerId];
}