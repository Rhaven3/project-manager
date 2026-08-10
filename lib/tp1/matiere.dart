class Matiere {
  List<double> notes = [];
  String name;


  Matiere(this.notes, this.name);

  double average() {
    return notes.reduce((a,b) => a+b) / notes.length;
  }

  static double getAverage(List<Matiere> matieres) {
    double avg = 0;
    for (var matiere in matieres) {
      avg += matiere.average();
    }
    return avg / matieres.length;
  }
}
