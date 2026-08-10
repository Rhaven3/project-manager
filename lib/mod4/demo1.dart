import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: DrinkList(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text("data"), Text("data")],
          ),
        ],
      ),
    );
  }
}

class BigPage extends StatelessWidget {
  // const BigPage({super.key})

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          children: [
            Column(
              children: [Text("eheh"), SizedBox(height: 2500), Text("data")],
            ),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}

class DrinkList extends StatelessWidget {
  List<String> drinks = [
    "morito",
    "moscow mule",
    "Diplomatico",
    "Républico",
    "Démocratico"
  ];

  DrinkList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: ListView.builder(
          itemCount: drinks.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.blue,
              height: 100,
              child: Text(drinks[index]),
            );
          },
        ),
      ),
    );
  }
}
