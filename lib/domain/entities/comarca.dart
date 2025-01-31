class ComarcaEntity {
  
  final String uiduser;
  final String imagePath; // Ruta de la imagen
  final String comarquesName; // Nombre de la provincia
  final String capital;
  final String descrip;

  const ComarcaEntity({
    required this.uiduser,
    required this.imagePath,
    required this.comarquesName,
    required this.capital,
    required this.descrip
  });
}
