import 'package:flutter/cupertino.dart';

class Project {
  String title;
  String desc;
  ProjectEnum status;
  DateTime? date;

  Project(
    this.title,
    this.desc, {
    this.status = ProjectEnum.forthcomming,
    this.date,
  });
}

enum ProjectEnum {
  inProgress("En Cours"),
  finished("Terminé"),
  forthcomming("À Venir");

  final String text;
  const ProjectEnum(this.text);

  static ProjectEnum? fromName(String name) {
    for (var enumSate in ProjectEnum.values) {
      if (enumSate.name == name) {
        return enumSate;
      }
    }
    return null;
  }
}
