import 'ciudad.dart';

class Zona{
  String nombre;
  String ciudad;

  Zona(nombre, ciudad){
    this.nombre = nombre;
    this.ciudad = ciudad;
  }

  String getNombre(){
    return nombre;
  }

  String getCiudad(){
    return ciudad;
  }
}