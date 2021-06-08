import 'package:p4_s1/aplicacion_paseadores.dart';
import 'package:p4_s1/gato.dart';
import 'package:p4_s1/huron.dart';
import 'package:p4_s1/mascota.dart';
import 'package:p4_s1/paseador.dart';
import 'package:p4_s1/paseo.dart';
import 'package:p4_s1/perro.dart';
import 'package:p4_s1/usuario.dart';
import 'package:p4_s1/zona.dart';
import 'package:test/test.dart';

void main(){
  group('Usuario', (){

    var zonas = List<Zona>();

    List<Mascota> mascotas = new List<Mascota>();
    mascotas.add(new Perro('Ruki', 6));
    mascotas.add(new Huron('Lara', 1));

    test('Comprobamos el nombre del usuario', (){

      final usuario = new Usuario('Francisco', 32, 'francisco@hotmail.com', mascotas);
      expect(usuario.getNombre(), 'Francisco');
    });

    test('Comprobamos que tiene a Ruki', (){

      final usuario = new Usuario('Francisco', 32, 'francisco@hotmail.com', mascotas);
      expect(usuario.tieneMascota(mascotas.elementAt(0)), true);
    });

    test('Comprobamos que aniade una mascota', (){

      final usuario = new Usuario('Francisco', 32, 'francisco@hotmail.com', mascotas);
      usuario.agregarMascota(new Gato('Tifo', 2));
      expect(usuario.mascotas.length, 3);
    });
  });

  group('Paseo', (){

    var now = new DateTime.now();

    test('Comprobar duracion paseo', (){
      final paseo = new Paseo();
      paseo.agregarDuracion(now);
      expect(paseo.duracion_paseo, now);
    });

    test('Comprobar paseador', (){
      final paseo = new Paseo();
      var paseador = new Paseador('Paco', 21, 'francisco@hotmail.com');
      paseo.agregarPaseador(paseador);

      expect(paseo.paseador, paseador);
    });

    test('Comprobamos las mascotas', (){
      final paseo = new Paseo();

      List<Mascota> mascotas = new List<Mascota>();
      mascotas.add(new Perro('Ruki', 6));
      mascotas.add(new Huron('Lara', 1));

      paseo.agregarMascotas(mascotas);
      expect(paseo.mascotas, mascotas);
    });
  });

  group('AplicacionMascota', (){

    var paseo = new Paseo();
    List<Mascota> mascotas1 = new List<Mascota>();
    mascotas1.add(new Perro('Ruki', 6));
    mascotas1.add(new Huron('Lara', 1));

    List<Mascota> mascotas2 = new List<Mascota>();
    mascotas2.add(new Perro('Kira', 7));
    mascotas2.add(new Huron('Lorel', 2));

    Zona zona1 = new Zona('Armilla', 'Granada');
    Zona zona2 = new Zona('Granada', 'Granada');

    Usuario user1 = new Usuario('Fernando', 31, 'francisco@hotmail.com', mascotas1);
    Usuario user2 = new Usuario('Alfonso', 31, 'francisco@hotmail.com', mascotas2);
    var usuarios = new List<Usuario>();
    usuarios.add(user1);
    usuarios.add(user2);

    Paseador paseador1 = new Paseador('Esteban', 23, 'francisco@hotmail.com');
    Paseador paseador2 = new Paseador('Laura', 22, 'francisco@hotmail.com');
    var paseadores = new List<Paseador>();
    paseadores.add(paseador1);
    paseadores.add(paseador2);

    test('Busca el usuario correcto', (){
      final aplicacion = new AplicacionPaseadores();
      var mascota_ejemplo = mascotas2.elementAt(1); //Lorel
      var usuario_prueba = aplicacion.buscarUsuario(mascota_ejemplo);

      expect(aplicacion.usuarios.elementAt(1), usuario_prueba);
    });

    test('Agregamos mascota a usuario', (){
      final aplicacion = new AplicacionPaseadores();
      Mascota ejemplo = new Gato('Lucy', 3);
      aplicacion.agregarMascotaAUsuario('Fernando', ejemplo);

      expect(aplicacion.usuarios.elementAt(0).mascotas.length, 3);
    });

    test('Registramos usuario', (){
      final aplicacion = new AplicacionPaseadores();
      aplicacion.registrarUsuario('Lucia', 21, 'francisco@hotmail.com');

      expect(aplicacion.usuarios.length, 3);
    });
  });
}