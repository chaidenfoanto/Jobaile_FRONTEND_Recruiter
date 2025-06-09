part of 'detail_bloc.dart';

abstract class WorkerDetailState extends Equatable {
  const WorkerDetailState();

  @override
  List<Object> get props => [];
}

class WorkerDetailInitial extends WorkerDetailState {}

class WorkerDetailLoading extends WorkerDetailState {}

class WorkerDetailLoaded extends WorkerDetailState {
  final Worker worker;

  const WorkerDetailLoaded(this.worker);

  @override
  List<Object> get props => [worker];
}

class WorkerDetailError extends WorkerDetailState {
  final String message;

  const WorkerDetailError(this.message);

  @override
  List<Object> get props => [message];
}