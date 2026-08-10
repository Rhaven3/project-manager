import 'package:cours_flutter/tp_fil_rouge/shared/project-form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../model/project.dart';

class ProjectEditPage extends StatelessWidget {
  Project project;

  ProjectEditPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(project.title), centerTitle: true),
      body: ProjectForm(project: project, submit: (project) {
        context.go("/projects");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${project.title} a été mis à jour"))
        );
      }),
    );
  }
}
