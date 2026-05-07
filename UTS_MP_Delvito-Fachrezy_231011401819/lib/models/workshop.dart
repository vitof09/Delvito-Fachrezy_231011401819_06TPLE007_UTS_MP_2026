class Workshop {
  final String title;
  final String date;
  final String time;
  final String location;
  final int quotaLeft;
  final int quotaTotal;

  Workshop({
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.quotaLeft,
    required this.quotaTotal,
  });

  String get quotaText => 'Sisa: $quotaLeft / $quotaTotal';

  // Untuk data dummy (contoh data statis)
  static List<Workshop> getDummyWorkshops() {
    return [
      Workshop(
        title: 'Workshop: Mobile Programming dengan Flutter untuk Pemula',
        date: 'Senin, 15 Mei 2026',
        time: '09:00 - 15:00 WIB',
        location: 'Lab Teknik Informatika A, Gedung FTIK Lantai 3',
        quotaLeft: 25,
        quotaTotal: 40,
      ),
      Workshop(
        title: 'Workshop: Menjadi IT Consultant – Strategi & Studi Kasus',
        date: 'Rabu, 24 Mei 2026',
        time: '13:00 - 17:00 WIB',
        location: 'Ruang Seminar 2, Gedung Pusat',
        quotaLeft: 12,
        quotaTotal: 30,
      ),
      Workshop(
        title: 'Seminar: AI & Masa Depan Teknik Informatika',
        date: 'Sabtu, 3 Juni 2026',
        time: '08:00 - 12:00 WIB',
        location: 'Aula Utama Kampus',
        quotaLeft: 87,
        quotaTotal: 150,
      ),
      Workshop(
        title: 'Advanced Workshop: Backend Development dengan Golang',
        date: 'Jumat, 9 Juni 2026',
        time: '09:00 - 16:00 WIB',
        location: 'Lab Teknik Informatika B, Gedung FTIK Lantai 2',
        quotaLeft: 8,
        quotaTotal: 25,
      ),
      Workshop(
        title: 'Workshop: Cyber Security Fundamental untuk Mahasiswa TI',
        date: 'Selasa, 20 Juni 2026',
        time: '10:00 - 15:00 WIB',
        location: 'Lab Jaringan Komputer, Gedung FTIK Lantai 1',
        quotaLeft: 18,
        quotaTotal: 35,
      ),
      Workshop(
        title: 'Workshop: Database Optimization & SQL for Big Data',
        date: 'Kamis, 29 Juni 2026',
        time: '09:00 - 14:00 WIB',
        location: 'Lab Database, Gedung FTIK Lantai 3',
        quotaLeft: 22,
        quotaTotal: 30,
      ),
    ];
  }
}