import 'package:cours_flutter/mod5/model/item.dart';
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
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<List<Item>>(
        valueListenable: itemsNotifier,
        builder: (context, items, _) {
          return Row(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return LineCartWidget(item: items[index]);
                  },
                ),
              ),
              Text("Total commande = ${Item.getTotalItems(items)}"),
            ],
          );
        },
      ),
    );
  }
}

class LineCartWidget extends StatefulWidget {
  final Item item;

  const LineCartWidget({super.key, required this.item});

  @override
  State<LineCartWidget> createState() => _LineCartWidgetState();
}

class _LineCartWidgetState extends State<LineCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.item.title),
        IconButton(onPressed: _increment, icon: Icon(Icons.add_circle_outline)),
        Text("${widget.item.quantity}"),
        IconButton(
          onPressed: _decrement,
          icon: Icon(Icons.remove_circle_outline),
        ),
        Text("= ${widget.item.getTotal()}"),
      ],
    );
  }

  void _increment() {
    setState(() {
      widget.item.quantity++;
      itemsNotifier.notifyListeners(); // Notifie les écouteurs
    });
  }

  void _decrement() {
    setState(() {
      if (widget.item.quantity > 0) {
        widget.item.quantity--;
        itemsNotifier.notifyListeners(); // Notifie les écouteurs
      }
    });
  }
}

final itemsNotifier = ValueNotifier<List<Item>>(items);

List<Item> items = <Item>[
  Item("Rabadon", 1, 34.99),
  Item("Leviathan", 1, 12.74),
  Item("Warmog", 1, 30.99),
];
