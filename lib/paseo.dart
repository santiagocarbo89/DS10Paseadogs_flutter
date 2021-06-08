import 'package:p4_s1/paseador.dart';
import 'mascota.dart';

class Paseo{
  DateTime duracion_paseo;
  Paseador paseador;
  List<Mascota> mascotas;

  Paseo(){
    this.duracion_paseo = null;
    this.mascotas = null;
    this.paseador = null;
  }

  void agregarDuracion(duracion_paseo){
    this.duracion_paseo = duracion_paseo;
  }

  void agregarPaseador(paseador){
    this.paseador = paseador;
  }

  void agregarMascotas(mascotas){
    this.mascotas = mascotas;
  }
}