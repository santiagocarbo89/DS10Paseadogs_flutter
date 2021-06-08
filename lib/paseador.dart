import 'package:p4_s1/paseo.dart';
import 'package:p4_s1/zona.dart';

class Paseador{
  String nombre;
  int edad;
  String correo;
  Paseo paseo;

  Paseador(nombre, edad, correo){
    this.nombre = nombre;
    this.edad = edad;
    this.correo = correo;
  }

  String getNombre(){
    return nombre;
  }
  int getEdad(){
    return edad;
  }

  String getCorreo(){
    return correo;
  }

  Paseo getPaseo(){
    return paseo;
  }
}