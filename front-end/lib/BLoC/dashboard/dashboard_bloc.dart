import 'package:flutter_bloc/flutter_bloc.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';
import '/repository/dashboard_repository.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardRepository repository;

  DashboardBloc(this.repository) : super(DashboardInitial()) {
    on<LoadWorkers>((event, emit) async {
      emit(DashboardLoading());
      try {
        final workers = await repository.fetchHelpers();
        emit(DashboardLoaded(workers));
      } catch (e) {
        emit(DashboardError('Gagal memuat data.'));
      }
    });
  }
}
