import 'package:flutter/material.dart';
import 'package:gaflutter/screens/counties.dart';

class InfoWidget extends StatelessWidget {
  final String imagePath; // Ruta de la imagen
  final String comarquesName; // Nombre de la provincia
  final String capital;
  final String descrip;

  const InfoWidget({
    Key? key,
    required this.imagePath,
    required this.comarquesName,
    required this.capital,
    required this.descrip
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          imagePath,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 8),
        Text(
          comarquesName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6),
        Text(
          capital,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6),
        Text(
          descrip,
          style: TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}

class InfoComarca1Screen extends StatelessWidget {
 
  const InfoComarca1Screen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        ),
      body: InfoWidget(
        comarquesName: provincies["provincies"][0]["comarques"][0]["comarca"],
        imagePath: provincies["provincies"][0]["comarques"][0]["img"],
        capital: "Capital: " + provincies["provincies"][0]["comarques"][0]["capital"],
        descrip: provincies["provincies"][0]["comarques"][0]["desc"],
      ),
    );
  }
}