import 'package:flutter/material.dart';
import 'package:gaflutter/screens/counties.dart';
import 'package:go_router/go_router.dart';

//FirebaseAuth.instance.currentUser.uid

class ComarquesWidget extends StatelessWidget {
  final String imagePath; // Ruta de la imagen
  final String comarquesName; // Nombre de la provincia
  final int indice;
  final int indicepro;

  const ComarquesWidget({
    Key? key,
    required this.imagePath,
    required this.comarquesName,
    required this.indice,
    required this.indicepro
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
        TextButton(
                  onPressed: () {
                    context.push("/info1/$indicepro/$indice");
                  },    
        child: Text(
          comarquesName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        )
      ],
    );
  }
}

class ComarquesScreen extends StatelessWidget {
 
  final String pro;
  const ComarquesScreen({
    Key? key,
    required this.pro
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
            indice: index,
            indicepro: int.parse(this.pro),
          );
        },
      ),
    );
  }
}