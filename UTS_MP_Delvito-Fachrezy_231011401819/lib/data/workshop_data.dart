import '../models/workshop.dart';

class WorkshopData {
  static List<Workshop> _workshops = Workshop.getDummyWorkshops();

  static List<Workshop> getWorkshops() {
    return _workshops;
  }

  static void addWorkshop(Workshop workshop) {
    _workshops.add(workshop);
  }

  static void removeWorkshop(int index) {
    _workshops.removeAt(index);
  }

  // Fungsi untuk mendaftar ke workshop (mengurangi kuota)
  static bool registerForWorkshop(int index) {
    if (index >= 0 && index < _workshops.length) {
      final workshop = _workshops[index];
      if (workshop.quotaLeft > 0) {
        // Buat workshop baru dengan kuota berkurang
        final updatedWorkshop = Workshop(
          title: workshop.title,
          date: workshop.date,
          time: workshop.time,
          location: workshop.location,
          quotaLeft: workshop.quotaLeft - 1,
          quotaTotal: workshop.quotaTotal,
        );
        _workshops[index] = updatedWorkshop;
        return true;
      }
    }
    return false;
  }
}