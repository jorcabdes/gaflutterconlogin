import 'package:flutter/material.dart';
import 'package:gaflutter/screens/counties.dart';

class ProvinceWidget extends StatelessWidget {
  final String imagePath; // Ruta de la imagen
  final String provinceName; // Nombre de la provincia

  const ProvinceWidget({
    Key? key,
    required this.imagePath,
    required this.provinceName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          imagePath,
          width: 200,
          height: 100,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 8),
        Text(
          provinceName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class ProvinciasScreen extends StatelessWidget {
 
  const ProvinciasScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text(
              'Provincias del País Valencià',
            ),
          ),
        ),
      body: ListView.builder(
        itemCount: provincies["provincies"].length,
        itemBuilder: (context, index) {
          final provincia = provincies["provincies"][index];
          return ProvinceWidget(
            provinceName: provincia["provincia"],
            imagePath: provincia["img"],
          );
        },
      ),
    );
  }
}


