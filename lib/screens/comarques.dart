import 'package:flutter/material.dart';
import 'package:gaflutter/screens/counties.dart';

class ComarquesWidget extends StatelessWidget {
  final String imagePath; // Ruta de la imagen
  final String comarquesName; // Nombre de la provincia

  const ComarquesWidget({
    Key? key,
    required this.imagePath,
    required this.comarquesName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          imagePath,
          width: 300,
          height: 100,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 8),
        Text(
          comarquesName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class ComarquesScreen extends StatelessWidget {
 
  const ComarquesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text(
              'Comarques de Valencia',
            ),
          ),
        ),
      body: ListView.builder(
        itemCount: provincies["provincies"][0]["comarques"].length,
        itemBuilder: (context, index) {
          final comarques = provincies["provincies"][0]["comarques"][index];
          return ComarquesWidget(
            comarquesName: comarques["comarca"],
            imagePath: comarques["img"],
          );
        },
      ),
    );
  }
}