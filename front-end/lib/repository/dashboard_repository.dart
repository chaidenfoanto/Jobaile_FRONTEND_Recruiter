import '../models/worker_model.dart';

class DashboardRepository {
  Future<List<Worker>> fetchHelpers() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      Worker(
        image: 'assets/images/helper_dashboard/helper1.png',
        name: 'Nur Harmawati Kudus',
        age: 28,
        description:
            'Berpengalaman lebih dari 3 tahun sebagai ART, terbiasa mengurus dan membersihkan rumah secara detail. Ramah dan disiplin dalam bekerja.',
        rating: 4.5,
      ),
      Worker(
        image: 'assets/images/helper_dashboard/helper2.png',
        name: 'Siti Komariah',
        age: 55,
        description:
            'Ahli dalam memasak makanan rumahan, rapi dalam pekerjaan, dan sudah terbiasa bekerja dengan keluarga yang memiliki anak kecil dan hewan kelinci.',
        rating: 4,
      ),
      Worker(
        image: 'assets/images/helper_dashboard/helper3.png',
        name: 'Yuni Lestari',
        age: 31,
        description:
            'Telaten dan sabar, cocok untuk menjaga lansia atau anak. Pernah bekerja sebagai ART tinggal dalam selama 2 tahun di Mks.',
        rating: 4,
      ),
      Worker(
        image: 'assets/images/helper_dashboard/helper4.png',
        name: 'Kiran Natasya Kenta',
        age: 19,
        description:
            'Berpengalaman merawat balita dengan telaten dan sabar. Terbiasa mengikuti jadwal dan disiplin waktu.',
        rating: 3,
      ),
    ];
  }
}
