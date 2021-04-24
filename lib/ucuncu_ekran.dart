import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'ana_ekran.dart';

class UcuncuEkran extends StatefulWidget {
  static const routeName = '/ucuncu';
  @override
  State<UcuncuEkran> createState() => UcuncuEkranState();
}

class UcuncuEkranState extends State<UcuncuEkran> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(37.77483, -122.41942)),
      ),
    );
  }
}
