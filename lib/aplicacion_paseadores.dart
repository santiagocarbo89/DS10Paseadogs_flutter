import 'dart:io';

import 'package:p4_s1/mascota.dart';
import 'package:p4_s1/paseador.dart';
import 'package:p4_s1/paseo.dart';
import 'package:p4_s1/perro.dart';
import 'package:p4_s1/usuario.dart';
import 'package:p4_s1/zona.dart';

class AplicacionPaseadores{
  List<Usuario> usuarios;
  List<Paseador> paseadores;
  List<Zona> zonas;
  Usuario usuario_actual;
  Paseador paseador_actual;
  Paseo paseo_actual;

  AplicacionPaseadores(){
    this.usuarios = new List();
    List<Mascota> mascotas = new List();
    mascotas.add(new Perro("Anakin", 1));
    Usuario paco = new Usuario("Paco", 19, "paco@hotmail.com", mascotas);
    usuarios.add(paco);
    this.paseadores = new List();
    Paseador paco2 = new Paseador("Fernando", 33, "fernando@hotmail.com");
    paseadores.add(paco2);
    usuario_actual = null;
    paseador_actual = null;
    paseo_actual = new Paseo();
    this.zonas = new List();
    zonas.add(new Zona("Padul", "Granada"));
  }

  void registrarUsuario(nombre, edad, correo){
    var user = new Usuario(nombre, edad, correo, null);
    usuarios.add(user);
  }

  void eliminarUsuario(usuario){
    usuarios.remove(usuario);
  }

  List<Usuario> mostrarUsuarios(){
    return usuarios;
  }

  List<Paseador> mostrarPaseadores(){
    return paseadores;
  }

  void registrarZona(nombre, ciudad){
    var user = new Zona(nombre, ciudad);
    zonas.add(user);
  }

  List<Zona> mostrarZonas(){
    return zonas;
  }

  void eliminarZona(usuario){
    zonas.remove(usuario);
  }

  void registrarPaseador(nombre, edad, correo){
    var pas = new Paseador(nombre, edad, correo);
    paseadores.add(pas);
  }

  void eliminarPaseador(usuario){
    paseadores.remove(usuario);
  }



  void agregarMascotaAUsuario(nombre_usuario, mascota){
    bool continuar = true;

    for(int i = 0; i < usuarios.length && continuar; i++){
      if(usuarios.elementAt(i).getNombre() == nombre_usuario){
        usuarios.elementAt(i).agregarMascota(mascota);
        continuar = false;
      }
    }
  }

  Usuario buscarUsuario(mascota){
    Usuario resultado;
    bool continuar = true;

    for(int i = 0; i < usuarios.length && continuar; i++){
      if(usuarios.elementAt(i).tieneMascota(mascota)){
        resultado = usuarios.elementAt(i);
        continuar = false;
      }
    }

    return resultado;
  }




}