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
      title: 'Tip calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool istoggeled = false;
  String amountByPerson = "0";
  int _counter = 0;
  double amount = 0.0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Utip"),
        actions: [
          IconButton(
            onPressed:
                () => {
                  setState(() {
                    istoggeled = !istoggeled;
                  }),
                },
            icon: Icon(
              istoggeled ? Icons.toggle_on_outlined : Icons.toggle_off_outlined,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Card(
            color: Colors.blue,
            child: ListTile(
              textColor: Colors.white,
              title: Center(child: const Text("Total per person")),
              subtitle: Center(child: Text(amountByPerson)),
            ),
          ),
          Card(
            color: Colors.white,
            shadowColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Enter Bill Amount",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                    onChanged: (value) {
                      setState(() {
                        amountByPerson = value;
                      });
                    },
                  ),

                  Divider(thickness: 0.4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 10,
                    children: [
                      Text(
                        "Splint",
                        style: (TextStyle(fontSize: 18, color: Colors.blue)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        spacing: 1,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove, color: Colors.blue),
                            onPressed: _decrement,
                          ),
                          Text(
                            '$_counter',
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.blue,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add, color: Colors.blue),
                            onPressed: _increment,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(thickness: 0.4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 10,
                    children: [
                      Text(
                        "Tips",
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                      Text("20.20"),
                    ],
                  ),
                  Slider(
                    min: 0,
                    max: 100,
                    value: amount,
                    onChanged: (double newValue) {
                      setState(() {
                        amount = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
