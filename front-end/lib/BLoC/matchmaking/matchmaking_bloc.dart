// bloc/worker_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '/models/worker.dart';

part 'matchmaking_event.dart';
part 'matchmaking_state.dart';

class WorkerBloc extends Bloc<WorkerEvent, WorkerState> {
  WorkerBloc() : super(WorkerInitial()) {
    on<LoadNextWorkerEvent>(_onLoadNextWorker);
    on<ViewWorkerDetailEvent>(_onViewWorkerDetail);
  }

  // Simpan index worker yang saat ini ditampilkan
  int _currentWorkerIndex = -1;

  Future<void> _onLoadNextWorker(
      LoadNextWorkerEvent event, Emitter<WorkerState> emit) async {
    emit(WorkerLoading());
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      // Ambil worker selanjutnya secara acak atau berurutan
      // Untuk simulasi, kita akan loop melalui dummy data
      _currentWorkerIndex++;
      if (_currentWorkerIndex >= Worker.dummyWorkers.length) {
        _currentWorkerIndex = 0; // Kembali ke awal jika sudah habis
      }

      final Worker nextWorker = Worker.dummyWorkers[_currentWorkerIndex];
      emit(WorkerLoaded(nextWorker));
    } catch (e) {
      emit(WorkerError('Failed to load worker: ${e.toString()}'));
    }
  }

  void _onViewWorkerDetail(
      ViewWorkerDetailEvent event, Emitter<WorkerState> emit) {
    // Event ini hanya memicu navigasi, tidak mengubah state bloc secara langsung
    // Navigasi akan ditangani di UI (WorkerDiscoveryPage)
    // Untuk tujuan BLoC, kita bisa tambahkan logika jika diperlukan
    // Misalnya, menyimpan worker yang sedang dilihat ke state jika ada kebutuhan spesifik
  }
}