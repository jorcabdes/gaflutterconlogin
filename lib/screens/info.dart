import 'package:flutter/material.dart';
import 'package:gaflutter/blocs/tasks/tasks_bloc.dart';
import 'package:gaflutter/blocs/tasks/tasks_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaflutter/data/repositories/task_repository_impl.dart';
import 'package:gaflutter/domain/entities/comarca.dart';
import 'package:gaflutter/domain/repositories/comarca_repository.dart';
import 'package:gaflutter/screens/counties.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gaflutter/peticions_http.dart';


class InfoWidget extends StatelessWidget {
  final String imagePath; // Ruta de la imagen
  final String comarquesName; // Nombre de la provincia
  final String capital;
  final String descrip;
  final String poblacion;
  //final int indicepro;
  //final int indicecomar;

  const InfoWidget({
    Key? key,
    required this.imagePath,
    required this.comarquesName,
    required this.capital,
    required this.descrip,
    required this.poblacion,
    //required this.indicepro,
    //required this.indicecomar
    
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
                    context.push("/info2/$comarquesName");
                  },
                  child: const Text("Tiempo"),
                ),
        TextButton(
                  onPressed: () {
                        final task = ComarcaEntity(
                          uiduser: FirebaseAuth.instance.currentUser!.uid,
                          imagePath: this.imagePath, // Ruta de la imagen
                          comarquesName: this.comarquesName, // Nombre de la provincia
                          capital: this.capital,
                          descrip: this.descrip
                        );
                        context.read<TasksBloc>().add(AddTaskEvent(task));
                        Navigator.of(context).pop(); // Vuelve al listado
                      
                  },
                  child: const Text("Favorito"),
                ),
      ],
    );
  }
}

class InfoComarca1Screen extends StatelessWidget {
 
  final String comar;

  const InfoComarca1Screen({
    Key? key,
    required this.comar
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: obtenirInfoComarca(comarca: comar),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        print(comar);
        print(snapshot.data);
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              ),
              
            body:InfoWidget(
              comarquesName: snapshot.data["comarca"],
              imagePath: snapshot.data["img"],
              capital: snapshot.data["capital"],
              descrip: snapshot.data["desc"],
              poblacion: snapshot.data["poblacio"],
              //indicepro: snapshot.data["latitud"],
              //indicecomar: snapshot.data["longitud"],
            ),
          );
        }
        return const CircularProgressIndicator();
      }
    );

  }
}