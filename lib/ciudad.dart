import 'package:p4_s1/zona.dart';

class Ciudad{
  String nombre;
  List<Zona> zonas;

  Ciudad(nombre, zonas){
    this.nombre = nombre;
    this.zonas = zonas;
  }

  String getNombre(){
    return nombre;
  }
}