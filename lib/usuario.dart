import 'package:p4_s1/mascota.dart';
import 'package:p4_s1/zona.dart';

class Usuario{
  String nombre;
  int edad;
  String correo;
  List<Mascota> mascotas;

  Usuario(nombre, edad, correo, mascotas){
    this.nombre = nombre;
    this.edad = edad;
    this.correo = correo;
    this.mascotas = mascotas;
  }

  void agregarMascota(mascota){
    mascotas.add(mascota);
  }

  String getNombre(){
    return nombre;
  }

  int getEdad(){
    return edad;
  }

  bool tieneMascota(mascota){
    bool resultado = false;

    for(int i = 0; i < mascotas.length && !resultado; i++){
      if(mascotas.elementAt(i) == mascota)
        resultado = true;
    }

    return resultado;
  }

  String getCorreo(){
    return correo;
  }

}