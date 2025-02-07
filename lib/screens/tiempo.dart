import 'package:flutter/material.dart';
import 'package:gaflutter/screens/counties.dart';
import 'package:gaflutter/peticions_http.dart';


class InfoWidget2 extends StatefulWidget {
  final String imagePath; // Ruta de la imagen
  final String comarquesName; // Nombre de la provincia
  final String poblacion;
  final String latitud;
  final String longitud;
  //final int indicepro;
  //final int indicecomar;

  const InfoWidget2({
    Key? key,
    required this.imagePath,
    required this.comarquesName,
    required this.poblacion,
    required this.latitud,
    required this.longitud,
    //required this.indicepro,
    //required this.indicecomar
    
  });
  @override
  State<InfoWidget2> createState() => _WidgetClimaState();
}

class _WidgetClimaState extends State<InfoWidget2> {
  late Future<dynamic> info;
  @override
  void initState() {
    super.initState();
    info = obteClima(longitud: double.parse(widget.longitud) ?? 0.0, latitud: double.parse(widget.latitud) ?? 0.0);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: info,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          // Una vegada es resol el Future, tindrem disponible
          // la informació necessària per construir el giny
          String codi = snapshot.data["current_weather"]["weathercode"].toString();
          return Column(
            children: [
              
              _obtenirIconaOratge(codi),
              SizedBox(height: 8),
              Text(
                widget.comarquesName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text(
                widget.poblacion,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text(
                widget.latitud,
                style: TextStyle(fontSize: 10),
              ),
              SizedBox(height: 6),
              Text(
                widget.longitud,
                style: TextStyle(fontSize: 10),
              ),
            ],
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
class InfoComarca2Screen extends StatelessWidget {
 
  final String comar;

  const InfoComarca2Screen({
    Key? key,
    required this.comar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: obtenirInfoComarca(comarca: comar),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              ),
            body: InfoWidget2(
              comarquesName: snapshot.data["comarca"],
              imagePath: 'assets/img/sun.png',
              poblacion: snapshot.data["poblacio"],
              latitud: snapshot.data["latitud"].toString(),
              longitud: snapshot.data["longitud"].toString(),
              //indicepro: int.parse(pro),
              //indicecomar: int.parse(comar),
            ),
          );
        }
        return const CircularProgressIndicator();
      }
    );

  }
}
  Widget _obtenirIconaOratge(String value) {
    Set<String> sol = <String>{"0"};
    Set<String> pocsNuvols = <String>{"1", "2", "3"};
    Set<String> nuvols = <String>{"45", "48"};
    Set<String> plujasuau = <String>{"51", "53", "55"};
    Set<String> pluja = <String>{
      "61",
      "63",
      "65",
      "66",
      "67",
      "80",
      "81",
      "82",
      "95",
      "96",
      "99"
    };
    Set<String> neu = <String>{"71", "73", "75", "77", "85", "86"};

    if (sol.contains(value)) {
      return Image.asset("assets/img/soleado.png");
    }
    if (pocsNuvols.contains(value)) {
      return Image.asset("assets/img/poco_nublado.png");
    }
    if (nuvols.contains(value)) {
      return Image.asset("assets/img/nublado.png");
    }
    if (plujasuau.contains(value)) {
      return Image.asset("assets/img/lluvia_debil.png");
    }
    if (pluja.contains(value)) {
      return Image.asset("assets/img/lluvia.png");
    }
    if (neu.contains(value)) {
      return Image.asset("assets/img/nieve.png");
    }

    return Image.asset("assets/img/poco_nublado.png");
  }