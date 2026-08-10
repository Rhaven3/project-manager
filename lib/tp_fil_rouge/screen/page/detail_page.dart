import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../model/project.dart';

class ProjectDetailPage extends StatelessWidget {
  Project project;

  ProjectDetailPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.push("/project/edit", extra: project);
            },
            icon: Icon(Icons.edit),
          ),
        ],
        title: Text(project.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Statut : ${project.status!.text}",
              style: TextStyle(color: Colors.orange),
            ),
            Text(
              "Date de début : ${project.date.toString()}",
              style: TextStyle(color: Colors.blueAccent),
            ),
            Text(project.desc, style: TextStyle(color: Colors.blueAccent)),
          ],
        ),
      ),
    );
  }
}
