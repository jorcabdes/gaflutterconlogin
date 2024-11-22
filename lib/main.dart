import 'package:flutter/material.dart';
import 'package:gaflutter/screens/counties.dart';
import 'package:gaflutter/screens/login.dart';
import 'package:gaflutter/screens/login2.dart';
import 'package:gaflutter/screens/provincies.dart';
import 'package:gaflutter/screens/comarques.dart';
import 'package:gaflutter/screens/info.dart';
import 'package:gaflutter/screens/tiempo.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Comarcas',
      home: Scaffold(
          appBar: AppBar(
              title: const Text(
                'Comarcas',
              ),
              centerTitle: false, // Esto centrará el título en la AppBar
          ),
          //body: const LoginPage())));
          //body: const ProvinciasScreen())));
          //body: const ComarquesScreen())));
          //body: const InfoComarca1Screen())));
          body: const InfoComarca2Screen())));
}
