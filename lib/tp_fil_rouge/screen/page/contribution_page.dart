import 'package:cours_flutter/tp_fil_rouge/model/project.dart';
import 'package:cours_flutter/tp_fil_rouge/shared/project-form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContributionPage extends StatefulWidget {
  Function(Project) addProject;

  ContributionPage({super.key, required this.addProject});

  @override
  State<ContributionPage> createState() => _ContributionPageState();
}

class _ContributionPageState extends State<ContributionPage> {
  Project newProject = Project("", "");

  @override
  Widget build(BuildContext context) {
    return ProjectForm(project: newProject, submit: widget.addProject);
  }
}
