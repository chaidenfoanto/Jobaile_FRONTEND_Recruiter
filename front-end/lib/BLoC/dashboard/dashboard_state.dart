import '../../models/worker.dart';

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<Worker> workers;

  DashboardLoaded(this.workers);
}

class DashboardError extends DashboardState {
  final String message;

  DashboardError(this.message);
}
