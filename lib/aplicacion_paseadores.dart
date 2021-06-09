import 'dart:convert';
import 'dart:io';

import 'package:p4_s1/mascota.dart';
import 'package:p4_s1/paseador.dart';
import 'package:p4_s1/paseo.dart';
import 'package:p4_s1/perro.dart';
import 'package:p4_s1/huron.dart';
import 'package:p4_s1/gato.dart';
import 'package:p4_s1/usuario.dart';
import 'package:p4_s1/zona.dart';
import 'package:http/http.dart' as http;

class AplicacionPaseadores {
  List<Usuario> usuarios;
  List<Paseador> paseadores;
  List<Zona> zonas;
  Usuario usuario_actual;
  Paseador paseador_actual;
  Paseo paseo_actual;
  static String _baseAddress = 'clados.ugr.es';

  static String _applicationName = 'DS17/api/v1/';


  AplicacionPaseadores() {
    this.usuarios = new List();
    List<Mascota> mascotas = new List();
    List<Mascota> mascotas2 = new List();
    List<Mascota> mascotas3 = new List();
    mascotas.add(new Perro("Anakin", 1));
    mascotas.add(new Huron("Luke", 1));
    mascotas.add(new Gato("Vader", 1));
    mascotas2.add(new Perro("Luis", 1));
    mascotas2.add(new Huron("Mario", 1));
    mascotas2.add(new Gato("Ruki", 1));
    mascotas3.add(new Perro("Kebap", 1));
    mascotas3.add(new Huron("Maria", 1));
    mascotas3.add(new Gato("Estefania", 1));
    Usuario paco = new Usuario("Paco", 19, "paco@hotmail.com", mascotas);
    Usuario fernando = new Usuario(
        "Fernando", 19, "fernando@hotmail.com", mascotas2);
    Usuario pablo = new Usuario("Pablo", 19, "pablo@hotmail.com", mascotas3);
    usuarios.add(paco);
    usuarios.add(fernando);
    usuarios.add(pablo);
    this.paseadores = new List();
    Paseador fernando2 = new Paseador("Fernando", 33, "fernando2@hotmail.com");
    Paseador luisa = new Paseador("Luisa", 33, "luisa@hotmail.com");
    Paseador magdalena = new Paseador("Magdalena", 33, "magdalena@hotmail.com");
    paseadores.add(fernando2);
    paseadores.add(luisa);
    paseadores.add(magdalena);
    usuario_actual = null;
    paseador_actual = null;
    paseo_actual = new Paseo();
    this.zonas = new List();
    zonas.add(new Zona("Padul", "Granada"));
    zonas.add(new Zona("Gandia", "Valencia"));
    zonas.add(new Zona("Durcal", "Granada"));
    zonas.add(new Zona("Ubeda", "Jaen"));
  }

  void registrarUsuario(nombre, edad, correo) {
    var user = new Usuario(nombre, edad, correo, null);
    usuarios.add(user);
  }

  void eliminarUsuario(usuario) {
    usuarios.remove(usuario);
  }

  List<Usuario> mostrarUsuarios() {
    return usuarios;
  }

  List<Paseador> mostrarPaseadores() {
    return paseadores;
  }

  void registrarZona(nombre, ciudad) {
    var user = new Zona(nombre, ciudad);
    zonas.add(user);
  }

  List<Zona> mostrarZonas() {
    return zonas;
  }

  void eliminarZona(usuario) {
    zonas.remove(usuario);
  }

  void registrarPaseador(nombre, edad, correo) {
    var pas = new Paseador(nombre, edad, correo);
    paseadores.add(pas);
  }

  void eliminarPaseador(usuario) {
    paseadores.remove(usuario);
  }


  void agregarMascotaAUsuario(nombre_usuario, mascota) {
    bool continuar = true;

    for (int i = 0; i < usuarios.length && continuar; i++) {
      if (usuarios.elementAt(i).getNombre() == nombre_usuario) {
        usuarios.elementAt(i).agregarMascota(mascota);
        continuar = false;
      }
    }
  }

  Usuario buscarUsuario(mascota) {
    Usuario resultado;
    bool continuar = true;

    for (int i = 0; i < usuarios.length && continuar; i++) {
      if (usuarios.elementAt(i).tieneMascota(mascota)) {
        resultado = usuarios.elementAt(i);
        continuar = false;
      }
    }

    return resultado;
  }

  //Create
  static Future<bool> crearUsuario(Usuario user) async {
    final response = await http.post(
      Uri.https(_baseAddress, _applicationName + 'usuarios/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'Nombre': user.getNombre(),
        'Edad': user.getEdad().toString(),
        'Correo electrónico': user.getCorreo(),
      }),
    );
    if (response.statusCode == 201)
      return true;
    else
      throw Exception('Failed to create project');
  }


  static Future<bool> createPaseador(Paseador user) async {
    final response = await http.post(
      Uri.https(_baseAddress, _applicationName + 'paseadores/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'Nombre': user.getNombre(),
        'Edad': user.getEdad().toString(),
        'Correo electrónico': user.getCorreo(),
      }),
    );

    if (response.statusCode == 200)
      return true;
    else
      throw Exception('Failed to get project');
  }

  static Future<bool> createMascota(Mascota user) async {
    final response = await http.post(
      Uri.https(_baseAddress, _applicationName + 'mascotas/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'Nombre': user.getNombre(),
        'Edad': user.getEdad().toString(),
      }),
    );

    if (response.statusCode == 200)
      return true;
    else
      throw Exception('Failed to get project');
  }

  static Future<bool> createZona(Zona user) async {
    final response = await http.post(
      Uri.https(_baseAddress, _applicationName + 'zonas/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'Nombre': user.getNombre(),
        'Ciudad': user.getCiudad(),
      }),
    );

    if (response.statusCode == 200)
      return true;
    else
      throw Exception('Failed to get project');
  }

  //Delete
  static Future<bool> deleteUsuario(Usuario user) async {
    final http.Response response = await http.delete(
      Uri.https(_baseAddress, _applicationName + 'usuarios/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200)
      return true; //.fromJson(jsonDecode(response.body));
    else
      throw Exception('Failed to delete project.');
  }

  static Future<bool> deletePaseador(Paseador user) async {
    final http.Response response = await http.delete(
      Uri.https(_baseAddress, _applicationName + 'paseadores/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200)
      return true; //.fromJson(jsonDecode(response.body));
    else
      throw Exception('Failed to delete project.');
  }

  static Future<bool> deleteMascota(Mascota user) async {
    final http.Response response = await http.delete(
      Uri.https(_baseAddress, _applicationName + 'mascotas/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200)
      return true; //.fromJson(jsonDecode(response.body));
    else
      throw Exception('Failed to delete project.');
  }

  static Future<bool> deleteZona(Zona user) async {
    final http.Response response = await http.delete(
      Uri.https(_baseAddress, _applicationName + 'zonas/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200)
      return true; //.fromJson(jsonDecode(response.body));
    else
      throw Exception('Failed to delete project.');
  }

  //get
  static Future<List<Usuario>> getUsuarios(Usuario id) async {
    final response = await http.get(
        Uri.https(_baseAddress, _applicationName + 'usuarios/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> users = json.decode(response.body) as Map<
          String,
          dynamic>;
      var users_totales = <Usuario>[];
      for (int i = 0; i < users['totales'].length; i++) {
        var nombre = users['totales'][i]['nombre'];
        var edad = users['totales'][i]['edad'];
        var correo = users['totales'][i]['correo'];
        users_totales.add(new Usuario(nombre, edad, correo, null));
      }
      return users_totales;
    } else
      throw Exception('Failed to get project');
  }

  static Future<List<Paseador>> getPaseadores(Paseador id) async {
    final response = await http.get(
        Uri.https(_baseAddress, _applicationName + 'paseadores/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> users = json.decode(response.body) as Map<
          String,
          dynamic>;
      var paseadores_totales = <Paseador>[];
      for (int i = 0; i < users['totals'].length; i++) {
        var nombre = users['totale'][i]['nombre'];
        var edad = users['totals'][i]['edad'];
        var correo = users['totals'][i]['correo'];
        paseadores_totales.add(new Paseador(nombre, edad, correo));
      }
      return paseadores_totales;
    } else
      throw Exception('Failed to get project');
  }

  static Future<List<Perro>> getPerros(Perro id) async {
    final response = await http.get(
        Uri.https(_baseAddress, _applicationName + 'mascotas/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> users = json.decode(response.body) as Map<
          String,
          dynamic>;
      var perros_totales = <Perro>[];
      for (int i = 0; i < users['totalp'].length; i++) {
        var nombre = users['totalp'][i]['nombre'];
        var edad = users['totalp'][i]['edad'];
        perros_totales.add(new Perro(nombre, edad));
      }
      return perros_totales;
    } else
      throw Exception('Failed to get project');
  }

  static Future<List<Gato>> getGatos(Gato id) async {
    final response = await http.get(
        Uri.https(_baseAddress, _applicationName + 'mascotas/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> users = json.decode(response.body) as Map<
          String,
          dynamic>;
      var gatos_totales = <Gato>[];
      for (int i = 0; i < users['totalg'].length; i++) {
        var nombre = users['totalg'][i]['nombre'];
        var edad = users['totalg'][i]['edad'];
        gatos_totales.add(new Gato(nombre, edad));
      }
      return gatos_totales;
    } else
      throw Exception('Failed to get project');
  }


  static Future<List<Huron>> getHurones(Gato id) async {
    final response = await http.get(
        Uri.https(_baseAddress, _applicationName + 'mascotas/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> users = json.decode(response.body) as Map<
          String,
          dynamic>;
      var hurones_totales = <Huron>[];
      for (int i = 0; i < users['totalh'].length; i++) {
        var nombre = users['totalh'][i]['nombre'];
        var edad = users['totalh'][i]['edad'];
        hurones_totales.add(new Huron(nombre, edad));
      }
      return hurones_totales;
    } else
      throw Exception('Failed to get project');
  }

  static Future<List<Zona>> getZonas(Zona id) async {
    final response = await http.get(
        Uri.https(_baseAddress, _applicationName + 'zonas/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> users = json.decode(response.body) as Map<
          String,
          dynamic>;
      var zonas_totales = <Zona>[];
      for (int i = 0; i < users['totalz'].length; i++) {
        var nombre = users['totalz'][i]['nombre'];
        var ciudad = users['totalz'][i]['ciudad'];
        zonas_totales.add(new Zona(nombre, ciudad));
      }
      return zonas_totales;
    } else
      throw Exception('Failed to get project');
  }

}




