import 'package:cours_flutter/tp_fil_rouge/screen/page/contribution_page.dart';
import 'package:cours_flutter/tp_fil_rouge/screen/page/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/destination.dart';
import '../model/project.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Project> projects = <Project>[
    Project("Projet Mannhattan", "un projet vraiment énorme"),
    Project("Projet important", "un projet très important"),
  ];

  int _currentIndex = 0;
  bool isFABvisible = true;

  @override
  Widget build(BuildContext context) {
    List<Destination> allDestinations = <Destination>[
      Destination(
        'Mes Projets',
        Icons.folder_open,
        HomePage(projects: projects),
        true,
      ),
      Destination(
        'Contribuer',
        Icons.add_circle_outline,
        ContributionPage(addProject: submitProject),
        false,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.rocket_launch),
        title: Text(allDestinations[_currentIndex].title),
        centerTitle: true,
      ),
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: allDestinations.map<Widget>((Destination destination) {
            return destination.widget;
          }).toList(),
        ),
      ),

      floatingActionButton: isFABvisible
          ? FloatingActionButton(
              onPressed: addProject,
              child: Icon(CupertinoIcons.plus),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            if (index != _currentIndex) {
              _setFABvisibility(allDestinations[index].isFABvisible);
            }
            _currentIndex = index;
          });
        },
        items: allDestinations.map((Destination destination) {
          return BottomNavigationBarItem(
            icon: Icon(destination.icon),
            label: destination.title,
          );
        }).toList(),
      ),
    );
  }

  void _setFABvisibility(bool visibility) {
    isFABvisible = visibility;
  }

  void addProject() {
    Project project = Project(
      "Projet n°${projects.length + 1}",
      "p'tit nouveau projet là",
    );
    setState(() {
      projects.add(project);
    });
  }

  void submitProject(Project project) {
    setState(() {
      projects.add(project);
      _currentIndex = 0;
      _setFABvisibility(true);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Le projet ${project.title} a été ajouté")),
    );
  }
}
