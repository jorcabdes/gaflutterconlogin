import 'package:flutter/material.dart';
import 'package:gaflutter/screens/counties.dart';

class InfoWidget2 extends StatelessWidget {
  final String imagePath; // Ruta de la imagen
  final String comarquesName; // Nombre de la provincia
  final String poblacion;
  final String latitud;
  final String longitud;

  const InfoWidget2({
    Key? key,
    required this.imagePath,
    required this.comarquesName,
    required this.poblacion,
    required this.latitud,
    required this.longitud
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
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
          poblacion,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6),
        Text(
          latitud,
          style: TextStyle(fontSize: 10),
        ),
        SizedBox(height: 6),
        Text(
          longitud,
          style: TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}

class InfoComarca2Screen extends StatelessWidget {
 
  const InfoComarca2Screen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        ),
      body: InfoWidget2(
        comarquesName: provincies["provincies"][0]["comarques"][0]["comarca"],
        imagePath: 'assets/img/sun.png',
        poblacion: "Población: " + provincies["provincies"][0]["comarques"][0]["poblacio"],
        latitud: "Latitud: "+ provincies["provincies"][0]["comarques"][0]["coordenades"][0].toString(),
        longitud: "Longitud: "+provincies["provincies"][0]["comarques"][0]["coordenades"][1].toString(),

      ),
    );
  }
}