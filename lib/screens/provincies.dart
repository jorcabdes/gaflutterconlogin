import 'package:flutter/material.dart';
import 'package:gaflutter/screens/counties.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProvinceWidget extends StatelessWidget {
  final String imagePath; // Ruta de la imagen
  final String provinceName; // Nombre de la provincia
  final int indece;

  const ProvinceWidget({
    Key? key,
    required this.imagePath,
    required this.provinceName,
    required this.indece
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
        TextButton(
                  onPressed: () {
                    context.push("/comarcas/$indece");
                  },
        child: Text(
          provinceName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        )
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
          actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              context.push('/');
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed:(){
              context.push('/favoritas');
            }
            )
        ],
        ),
      body: ListView.builder(
        itemCount: provincies["provincies"].length,
        itemBuilder: (context, index) {
          final provincia = provincies["provincies"][index];
          return ProvinceWidget(
            provinceName: provincia["provincia"],
            imagePath: provincia["img"],
            indece: index,
          );
        },
      ),
    );
  }
}


