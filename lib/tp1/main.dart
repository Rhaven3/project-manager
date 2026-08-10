import 'package:cours_flutter/tp1/matiere.dart';

const int decimals = 1;

void main() {
  for (var matiere in matieres) {
    print("La moyenne en ${matiere.name} est de ${matiere.average().toStringAsFixed(decimals)}");
  }
  print("La moyène générale des matières est de ${Matiere.getAverage(matieres).toStringAsFixed(decimals)}");
}

var french = Matiere([10, 12, 15, 18, 9, 9, 8, 11, 13, 2, 14], "Français");
var math = Matiere([12, 12, 12, 15, 18, 20, 3, 10, 11, 13, 14], "Mathématique");
var info = Matiere([17, 18, 19, 20, 16, 15, 17, 16, 12, 14, 13], "Informatique");
List<Matiere> matieres = [french, math, info];

