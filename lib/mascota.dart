import 'package:p4_s1/paseo.dart';

abstract class Mascota{
  String nombre;
  int edad;
  Paseo paseo;

  Mascota(nombre, edad){
    this.nombre = nombre;
    this.edad = edad;
    this.paseo = new Paseo();
  }
}