import 'package:first_app/ucuncu_ekran.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'ikinci_ekran.dart';

class AnaEkran extends StatefulWidget {
  static const routeName = '/anaekran';
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  final GlobalKey<FormState> _formKey = GlobalKey(); // bu ne bak
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ana Ekran'),
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.white,
            Colors.blue,
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
                        child: Text('1. seçim'),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(HomePage.routeName);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.blue,
                        textColor: Colors.white,
                      ),
                      RaisedButton(
                        child: Text('2. seçim'),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(IkinciEkran.routeName);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.blue,
                        textColor: Colors.white,
                      ),
                      RaisedButton(
                        child: Text('3. seçim'),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(UcuncuEkran.routeName);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.blue,
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
