import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';
import 'ana_ekran.dart';
import 'ikinci_ekran.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Future<FirebaseApp> _future = Firebase.initializeApp();
  final databaseRef = FirebaseDatabase.instance.reference();
  final GlobalKey<FormState> _formKey = GlobalKey(); // bu ne bak

  @override
  Widget build(BuildContext context) {
    List tpep_pickup_datetime = new List();
    List trip_distance = new List();

    int capacity = 1550;
    FirebaseDatabase.instance
        .reference()
        .child("taxi")
        .orderByChild("trip_distance")
        .limitToLast(5)
        .once()
        .then((DataSnapshot snapshot) {
      //debugPrint("DATA ${snapshot.value}");
      Map<dynamic, dynamic> values = snapshot.value;

      values.forEach((key, values) {
        trip_distance.add(values["trip_distance"]);

        tpep_pickup_datetime.add(values["tpep_pickup_datetime"]);
        print(
            "trip_distance: ${values["trip_distance"]} date: ${values["tpep_pickup_datetime"]}");
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Birinci Ekran"),
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.white,
            Colors.yellow,
          ])),
        ),
        Center(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 500,
              width: 380,
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                        child: Text('Ana Ekran'),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(AnaEkran.routeName);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.yellow,
                        textColor: Colors.white,
                      ),
                      Container(
                        // A fixed-height child.
                        color: const Color(0xffeeee00), // Yellow
                        height: 50.0,
                        alignment: Alignment.center,
                        //child: const Text(x),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),

/*
      body: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    SizedBox(height: 30.0),
                  ],
                ),
              );
            }
          }),
*/
    );
  }
}
