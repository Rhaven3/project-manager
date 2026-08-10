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
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              validator: validateAge,
              decoration: InputDecoration(
                labelText: "Age",
                hintText: "Veuillez saisir votre age",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30)
                )
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Nom",
                  hintText: "Veuillez saisir votre nom",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  )
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "prénom",
                  hintText: "Veuillez saisir votre prénom",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  )
              ),
            )
          ],
        ),
      ),
    );
  }

  String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return "champ obligatoire";
    }
    if (int.parse(value) < 18) {
      return "interdit au mineur !";
    }
    return null;
  }
}
