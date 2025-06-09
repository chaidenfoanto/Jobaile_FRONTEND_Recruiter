import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:detail_profil/models/worker.dart';
import 'package:detail_profil/repository/detail_repository.dart';


part 'detail_event.dart';
part 'detail_state.dart';

class WorkerDetailBloc extends Bloc<WorkerDetailEvent, WorkerDetailState> {
  final ProfileRepository workerRepository;

  WorkerDetailBloc({required this.workerRepository}) : super(WorkerDetailInitial()) {
    on<LoadWorkerDetail>(_onLoadWorkerDetail);
  }

  Future<void> _onLoadWorkerDetail(
    LoadWorkerDetail event,
    Emitter<WorkerDetailState> emit,
  ) async {
    emit(WorkerDetailLoading());
    print('WorkerDetailBloc: Emitting WorkerDetailLoading state'); // Log
    try {
      final worker = await workerRepository.getWoRecDetail(event.workerId);
      emit(WorkerDetailLoaded(worker));
      print('WorkerDetailBloc: Emitting WorkerDetailLoaded state for ${worker.fullName}'); // Log
    } catch (e) {
      emit(WorkerDetailError(e.toString()));
      print('WorkerDetailBloc: Emitting WorkerDetailError state: ${e.toString()}'); // Log
    }
  }
}