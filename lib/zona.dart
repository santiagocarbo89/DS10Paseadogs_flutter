import 'ciudad.dart';

class Zona{
  String nombre;
  Ciudad ciudad;

  Zona(nombre, ciudad){
    this.nombre = nombre;
    this.ciudad = ciudad;
  }

  String getNombre(){
    return nombre;
  }

  Ciudad getCiudad(){
    return ciudad;
  }
}