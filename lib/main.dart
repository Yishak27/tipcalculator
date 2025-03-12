import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tipcalculator/providers/ThemeProvider.dart';
import 'package:tipcalculator/widgets/TipsSlider.dart';
import 'package:tipcalculator/widgets/TipsWidget.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ThemeProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Tip calculator',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // ),
      theme: theme.getTheme(),
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
  double amountByPerson = 0;
  int _numberOfPeople = 1;
  double persentage = 0.0;
  int amount = 0;

  void _increment() {
    setState(() {
      _numberOfPeople++;
    });
    if (_numberOfPeople >= 1) _calculateTotalTip();
  }

  void _decrement() {
    setState(() {
      _numberOfPeople <= 1 ? _numberOfPeople = 1 : _numberOfPeople--;
    });
    if (_numberOfPeople >= 1) _calculateTotalTip();
  }

  void _calculateTotalTip() {
    setState(() {
      amountByPerson = (amount * (persentage)) / _numberOfPeople;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Utip"),
        actions: [
          IconButton(
            onPressed: theme.toggleDarkTheme,
            // () => {
            //   setState(() {
            //     istoggeled = !istoggeled;
            //   }),
            // },
            iconSize: 30,

            icon: Icon(theme.isDarkTheme ? Icons.sunny : Icons.dark_mode),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.0),
          child: Divider(thickness: 0.2),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Card(
            color: Colors.blue,
            child: ListTile(
              textColor: Colors.white,
              title: Center(child: const Text("Total per person")),
              subtitle: Center(child: Text(amountByPerson.round().toString())),
              leading: Icon(
                Icons.monetization_on,
                size: 30.0,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Card(
                // color: Colors.white,
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
                        enabled: true,
                        decoration: InputDecoration(
                          labelText: "Enter Bill Amount",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.attach_money),
                        ),
                        onChanged: (value) {
                          setState(() {
                            amount = int.parse(value);
                          });
                          _calculateTotalTip();
                        },
                      ),

                      Divider(thickness: 0.4),
                      TipsWidget(
                        numberOfPeople: _numberOfPeople,
                        decrease: _decrement,
                        increase: _increment,
                      ),
                      Divider(thickness: 0.4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          Text(
                            "Tips",
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                          Text(
                            '${(persentage * 100).round()}',
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          ),
                        ],
                      ),
                      Divider(thickness: 0.2),
                      TipSlider(
                        persentage: persentage,
                        valueChange: (double value) {
                          setState(() {
                            persentage = value;
                          });
                          _calculateTotalTip();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
