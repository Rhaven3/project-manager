import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: _router,
    );
  }
}


final GoRouter _router = GoRouter(
  initialLocation: "/page-1",
  routes: [
    GoRoute(path: "/page-1", builder: (context, state) => PageOne()),
    GoRoute(path: "/page-2/:id", builder: (context, state) {
      int id = int.parse(state.pathParameters['id']!);
      // int id = state.extra as int;
      return PageTwo(articleId: id);
    })
  ]
);

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("page 1"),
        ElevatedButton(onPressed: () {
          context.push("/page-2", extra: 42);
        },  child: Text("-> page 2"))
      ],
    );
  }
}

class PageTwo extends StatelessWidget {
  int articleId;
  PageTwo({super.key, required this.articleId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("page 2 - $articleId"),
        ElevatedButton(onPressed: () {
          context.pop();
        },  child: Text("-> page 1"))
      ],
    );
  }
}
