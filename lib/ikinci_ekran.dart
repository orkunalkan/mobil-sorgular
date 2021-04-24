import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'ana_ekran.dart';
import 'dart:io';

class IkinciEkran extends StatefulWidget {
  static const routeName = '/ikinci';

  @override
  _IkinciEkranState createState() => _IkinciEkranState();
}

class _IkinciEkranState extends State<IkinciEkran> {
  final GlobalKey<FormState> _formKey = GlobalKey(); // bu ne bak
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    List tpep_pickup_datetime = new List();
    List trip_distance = new List();

    int capacity = 1550;
    /* FirebaseDatabase.instance
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
       


       
    });*/
    return Scaffold(
      appBar: AppBar(
        title: Text('İkinci Ekran'),
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.white,
            Colors.green,
          ])),
        ),
        Center(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 200,
              width: 200,
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
                        color: Colors.green,
                        textColor: Colors.white,
                      ),
                      TextField(
                        controller: myController,
                      ),
                      RaisedButton(
                        child: Text('Gönder'),
                        onPressed: () {
                          String x = myController.text.toString();
                          String birinci;
                          String ikinci;
                          print(x);
                          int a = x.length;

                          for (int i = 0; i < a; i++) {
                            if (x[i] == " ") {
                              birinci = x.substring(0, i);
                              ikinci = x.substring(i + 1);
                            }
                          }

                          print(birinci);
                          print(ikinci);
                          int val1 = int.tryParse(birinci);
                          int val2 = int.tryParse(ikinci);
                          if (val1 != 0) {
                            val1 = val1 * 50 - 1;
                          }
                          if (val2 != 0) {
                            val2 = val2 * 50 - 1;
                          }
                          print(val1);
                          print(val2);
                          void bubbleSort(var arr, var ky) {
                            int n = arr.length;
                            for (int i = 0; i < n - 1; i++)
                              for (int j = 0; j < n - i - 1; j++)
                                if (arr[j] > arr[j + 1]) {
                                  // swap arr[j+1] and arr[j]
                                  double temp = arr[j];
                                  arr[j] = arr[j + 1];
                                  arr[j + 1] = temp;
                                  int temp2 = ky[j];
                                  ky[j] = ky[j + 1];
                                  ky[j + 1] = temp2;
                                }
                          }

                          //var myInt = int.parse(x);
                          //assert(myInt is int);
                          //myInt = myInt*50
                          int count = 0;
                          var tmp = [];
                          var ky = [];
                          FirebaseDatabase.instance
                              .reference()
                              .child("taxi")
                              .orderByChild("trip_distance")
                              .limitToFirst(774)
                              .once()
                              .then((DataSnapshot snapshot) {
                            Map<dynamic, dynamic> values = snapshot.value;
                            values.forEach((key, values) {
                              var a = int.parse(key);
                              assert(a is int);
                              if ((val1) < a && (val2) > a) {
                                var b = double.parse(
                                    values["trip_distance"].toString());
                                assert(b is double);
                                tmp.add(b);
                                var a = int.parse(key.toString());
                                assert(a is int);
                                ky.add(a);
                                print(
                                    "Key ID: ${key} trip_distance: ${values["trip_distance"]} date: ${values["tpep_pickup_datetime"]}");
                                count = count + 1;
                              }
                            });
                            print("\n");
                            bubbleSort(tmp, ky);
                            // print(tmp);
                            //print(ky);
                            for (int i = 0; i < 5; i++) {
                              print(
                                  " en kısa ${i + 1}. key: ${ky[i]} trip_distance: ${tmp[i]}");
                            }
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.green,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
