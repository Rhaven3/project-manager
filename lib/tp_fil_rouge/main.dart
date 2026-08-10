import 'package:cours_flutter/tp_fil_rouge/screen/home_screen.dart';
import 'package:cours_flutter/tp_fil_rouge/screen/page/detail_page.dart';
import 'package:cours_flutter/tp_fil_rouge/screen/page/edit_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';

import 'model/project.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final MaterialColor primary = Colors.indigo;

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primary,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xffeceaea),
        cardTheme: CardThemeData(),
        listTileTheme: ListTileThemeData(iconColor: primary),
        appBarTheme: AppBarThemeData(backgroundColor: primary),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primary,
        ),
      ),
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: "/projects",
  routes: [
    GoRoute(path: "/projects", builder: (context, state) => HomeScreen()),
    GoRoute(
      path: "/project",
      builder: (context, state) {
        Project project = state.extra as Project;
        return ProjectDetailPage(project: project);
      },
    ),
    GoRoute(
      path: "/project/edit",
      builder: (context, state) {
        Project project = state.extra as Project;
        return ProjectEditPage(project: project);
      },
    ),
  ],
);
