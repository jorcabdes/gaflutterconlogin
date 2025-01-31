import 'package:gaflutter/domain/entities/comarca.dart';

class TaskModel {
  final String uiduser;
  final String imagePath; // Ruta de la imagen
  final String comarquesName; // Nombre de la provincia
  final String capital;
  final String descrip;

  TaskModel({required this.uiduser,
    required this.imagePath,
    required this.comarquesName,
    required this.capital,
    required this.descrip});

  factory TaskModel.fromJson(Map<String, dynamic> json, String id) {
    return TaskModel(
      uiduser: json['uiduser'],
      imagePath: json['imagePath'],// Ruta de la imagen
      comarquesName: json['comarquesName'], // Nombre de la provincia
      capital: json['capital'],
      descrip:json['descrip'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uiduser': uiduser,
      'imagePath': imagePath,// Ruta de la imagen
      'comarquesName': comarquesName, // Nombre de la provincia
      'capital': capital,
      'descrip':descrip,
    };
  }

  ComarcaEntity toEntity() {
    return ComarcaEntity(
      uiduser: uiduser,
      imagePath: imagePath,// Ruta de la imagen
      comarquesName: comarquesName, // Nombre de la provincia
      capital: capital,
      descrip:descrip,
    );
  }

  static TaskModel fromEntity(ComarcaEntity task) {
    return TaskModel(
      uiduser: task.uiduser,
      imagePath: task.imagePath,// Ruta de la imagen
      comarquesName: task.comarquesName, // Nombre de la provincia
      capital: task.capital,
      descrip: task.descrip,);
  }
}
