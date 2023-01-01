import 'package:flutter/material.dart';

import 'currency_converter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel unit conversions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(
        srcCountry: 'US',
        destCountry: 'AU',
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage(
      {super.key, required this.srcCountry, required this.destCountry});

  final String srcCountry;
  final String destCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destCountry),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CurrencyConverter(
              srcCurrency: "USD",
              destCurrency: "AUD",
            )
          ],
        ),
      ),
    );
  }
}
