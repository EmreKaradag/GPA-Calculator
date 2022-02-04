import 'package:flutter/material.dart';
import 'package:not_ortalama/constants/app_constants.dart';
import 'package:not_ortalama/widgets/ortalama_hesapla_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dinamik Not Ortalaması Hesapla",
      theme: ThemeData(
        primarySwatch: Constants.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: OrtalamaHesaplaPage(),
    );
  }
}