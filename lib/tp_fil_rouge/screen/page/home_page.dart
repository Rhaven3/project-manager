import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../model/project.dart';

class HomePage extends StatelessWidget {
  List<Project> projects;

  HomePage({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ProjectCard(project: projects[index]);
      },
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        mainAxisSize: .min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.folder_outlined),
            title: Text(project.title),
            subtitle: Text(project.desc),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            onTap: () {
              context.push("/project", extra: project);
            },
          ),
        ],
      ),
    );
  }
}
