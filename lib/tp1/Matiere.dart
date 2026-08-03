class Matiere {
  List<double> notes = [];
  String name;


  Matiere(this.notes, this.name);

  double average() {
    double avg = 0;
    notes.forEach((note) {
      avg += note;
    });
    return avg / notes.length;
  }

  static double getAverage(List<Matiere> matieres) {
    double avg = 0;
    matieres.forEach((matiere) {
      avg += matiere.average();
    });
    return avg / matieres.length;
  }
}
