import 'package:flutter/material.dart';
import 'package:gaflutter/screens/counties.dart';
import 'package:go_router/go_router.dart';

class InfoWidget extends StatelessWidget {
  final String imagePath; // Ruta de la imagen
  final String comarquesName; // Nombre de la provincia
  final String capital;
  final String descrip;
  final int indicepro;
  final int indicecomar;

  const InfoWidget({
    Key? key,
    required this.imagePath,
    required this.comarquesName,
    required this.capital,
    required this.descrip,
    required this.indicepro,
    required this.indicecomar
    
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
        TextButton(
                  onPressed: () {
                    context.push("/info2/$indicepro/$indicecomar");
                  },
                  child: const Text("Tiempo"),
                ),
      ],
    );
  }
}

class InfoComarca1Screen extends StatelessWidget {
 
  final String pro;
  final String comar;

  const InfoComarca1Screen({
    Key? key,
    required this.pro,
    required this.comar
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        ),
      body:InfoWidget(
        comarquesName: provincies["provincies"][int.parse(pro)]["comarques"][int.parse(comar)]["comarca"],
        imagePath: provincies["provincies"][int.parse(pro)]["comarques"][int.parse(comar)]["img"],
        capital: "Capital: " + provincies["provincies"][int.parse(pro)]["comarques"][int.parse(comar)]["capital"],
        descrip: provincies["provincies"][int.parse(pro)]["comarques"][int.parse(comar)]["desc"],
        indicepro: int.parse(pro),
        indicecomar: int.parse(comar),
      ),
    );
  }
}