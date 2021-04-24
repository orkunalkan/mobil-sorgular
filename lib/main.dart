import 'package:flutter/material.dart';
import 'home_page.dart';
import 'ana_ekran.dart';
import 'ikinci_ekran.dart';
import 'ucuncu_ekran.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void main() async {
  print("Enter your name : ");
  var name = stdin.readLineSync();
  print(name);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnaEkran(),
      routes: {
        AnaEkran.routeName: (ctx) => AnaEkran(),
        HomePage.routeName: (ctx) => HomePage(),
        IkinciEkran.routeName: (ctx) => IkinciEkran(),
        UcuncuEkran.routeName: (ctx) => UcuncuEkran(),
      },
    );
  }
}
