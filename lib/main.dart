import 'dart:io';

import 'package:flutter/material.dart';
import 'package:p4_s1/aplicacion_paseadores.dart';
import 'package:p4_s1/paseador.dart';
import 'package:p4_s1/usuario.dart';
import 'package:p4_s1/mascota.dart';
import 'package:p4_s1/perro.dart';
import 'package:p4_s1/gato.dart';
import 'package:p4_s1/huron.dart';
import 'package:p4_s1/zona.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

Future<AplicacionPaseadores> _futuro;
AplicacionPaseadores ap = new AplicacionPaseadores();
String _tipo = "";



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PASEADOGS',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: MyHomePage_inicio(title: 'PASEADOGS'),
    );
  }
}

class MyHomePage_inicio extends StatefulWidget {
  MyHomePage_inicio({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState_inicio createState() => _MyHomePageState_inicio();
}

class _MyHomePageState_inicio extends State<MyHomePage_inicio> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Row(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_mascotas(title: "Página Mascotas")),
                );
              },
              child: Text('MASCOTAS'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_usuarios(title: "Página Usuarios")),
                );
              },
              child: Text('USUARIOS'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_paseadores(title: "Página Paseadores")),
                );
              },
              child: Text('PASEADORES'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_zonas(title: "Página Zonas")),
                );
              },
              child: Text('ZONAS'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage_mascotas extends StatefulWidget {
  MyHomePage_mascotas({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState_mascotas createState() => _MyHomePageState_mascotas();
}

class _MyHomePageState_mascotas extends State<MyHomePage_mascotas> {
List<Usuario> usuarios = ap.mostrarUsuarios();

  String _mostrarMascotas() {

    String aux = "";

    setState(() {

      for(int i = 0; i < usuarios.length; i++){
        List<Mascota> mascotas = usuarios.elementAt(i).mascotas;

        for(int j = 0; j < mascotas.length; j++){
          aux += "Nombre mascota: " + mascotas.elementAt(j).getNombre() + "  Edad mascota: " + mascotas.elementAt(j).getEdad().toString();
          aux += "  Correo dueño: " + usuarios.elementAt(i).getCorreo() + "  \n";
        }
      }

    });

    return aux;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              _mostrarMascotas(),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        _tipo = "perro";

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage_mascotas_agregar(title: "Página Agregar Mascotas")),
                        );
                    },
                    child: Text('AÑADIR PERRO'),
                ),
                  ElevatedButton(
                    onPressed: () {
                      _tipo = "gato";

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage_mascotas_agregar(title: "Página Agregar Mascotas")),
                      );
                    },
                    child: Text('AÑADIR GATO'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _tipo = "huron";

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage_mascotas_agregar(title: "Página Agregar Mascotas")),
                      );
                    },
                    child: Text('AÑADIR HURON'),
                  ),
              ],
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_mascotas_eliminar(title: "Página Eliminar Mascotas")),
                );
              },
              child: Text('ELIMINAR MASCOTA'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('<-- VOLVER'),
            ),
          ],
        ),
      ),
    );
  }
}


class MyHomePage_mascotas_agregar extends StatefulWidget {
  MyHomePage_mascotas_agregar({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState_mascotas_agregar createState() => _MyHomePageState_mascotas_agregar();
}

class _MyHomePageState_mascotas_agregar extends State<MyHomePage_mascotas_agregar> {
  List<Usuario> usuarios = ap.mostrarUsuarios();

  TextEditingController nameMascotaController = TextEditingController();
  TextEditingController ageMascotaController = TextEditingController();
  TextEditingController mailUsuarioController = TextEditingController();

  void _registrarMascota() {
    setState(() {

      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

      bool continuar = true;
      Usuario usuario;

      for(int i = 0; i < usuarios.length && continuar; i++){
        if(usuarios.elementAt(i).getCorreo() == mailUsuarioController.text){
          usuario = usuarios.elementAt(i);
          continuar = false;
        }
      }

      if(!continuar){
        if(_tipo == "perro") {
          Mascota perro=new Perro(nameMascotaController.text,
              int.parse(ageMascotaController.text));
          usuario.agregarMascota(perro);
          AplicacionPaseadores.createMascota(perro);
        }
        else if(_tipo == "gato") {
          Mascota gato=new Gato(nameMascotaController.text,
              int.parse(ageMascotaController.text));
          usuario.agregarMascota(gato);
          AplicacionPaseadores.createMascota(gato);
        }
        else if(_tipo == "huron") {
          Mascota huron=new Huron(nameMascotaController.text,
              int.parse(ageMascotaController.text));
          usuario.agregarMascota(huron);
          AplicacionPaseadores.createMascota(huron);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[


            TextField (
              controller: mailUsuarioController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Correo del dueño',
                  hintText: 'Introduzca el correo del dueño'
              ),
            ),
            TextField (
              controller: nameMascotaController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Nombre de la mascota',
                  hintText: 'Introduzca el nombre de la mascota'
              ),
            ),

            TextField (
              controller: ageMascotaController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Edad de la mascota',
                  hintText: 'Introduzca la edad de la mascota'
              ),
            ),

            ElevatedButton(
              onPressed: () {
                _registrarMascota();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_mascotas(title: "Página Mascotas")),
                );
              },
              child: Text('AGREGAR MASCOTA'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('<-- VOLVER'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage_mascotas_eliminar extends StatefulWidget {
  MyHomePage_mascotas_eliminar({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState_mascotas_eliminar createState() => _MyHomePageState_mascotas_eliminar();
}

class _MyHomePageState_mascotas_eliminar extends State<MyHomePage_mascotas_eliminar> {
  List<Usuario> usuarios = ap.mostrarUsuarios();

  TextEditingController nameMascotaController = TextEditingController();
  TextEditingController mailUsuarioController = TextEditingController();

  void _eliminarMascota() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

      bool continuar = true;
      Usuario usuario;

      for(int i = 0; i < usuarios.length && continuar; i++){
        if(usuarios.elementAt(i).getCorreo() == mailUsuarioController.text){
          usuario = usuarios.elementAt(i);
          continuar = false;
        }
      }

      if(!continuar){
          usuario.eliminarMascota(nameMascotaController.text);
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[


            TextField (
              controller: mailUsuarioController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Correo del dueño',
                  hintText: 'Introduzca el correo del dueño'
              ),
            ),
            TextField (
              controller: nameMascotaController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Nombre de la mascota',
                  hintText: 'Introduzca el nombre de la mascota'
              ),
            ),

            ElevatedButton(
              onPressed: () {
                _eliminarMascota();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_mascotas(title: "Página Mascotas")),
                );
              },
              child: Text('ELIMINAR MASCOTA'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_mascotas(title: "Página Mascotas")),
                );
              },
              child: Text('<-- VOLVER'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage_usuarios extends StatefulWidget {
  MyHomePage_usuarios({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState_usuarios createState() => _MyHomePageState_usuarios();
}

class _MyHomePageState_usuarios extends State<MyHomePage_usuarios> {
  List<Usuario> usuarios = ap.mostrarUsuarios();
  String informacion = "";

  String _mostrarUsuarios() {
    String aux = "";

      for(int i = 0; i < usuarios.length; i++) {
        aux += "Nombre: " + usuarios.elementAt(i).getNombre() + "  ";
        aux += "Edad: " + usuarios.elementAt(i).getEdad().toString() + "  ";
        aux += "Correo electrónico: " + usuarios.elementAt(i).getCorreo() + "\n";
      }

    setState(() {
      informacion = aux;
    });

    return informacion;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              _mostrarUsuarios(),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_usuarios_agregar(title: "Página Agregar Usuarios")),
                );
              },
              child: Text('AÑADIR USUARIO'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_usuarios_eliminar(title: "Página Eliminar Usuarios")),
                );
              },
              child: Text('ELIMINAR USUARIO'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_inicio(title: "Página Inicio")),
                );
              },
              child: Text('<-- VOLVER'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage_usuarios_agregar extends StatefulWidget {
  MyHomePage_usuarios_agregar({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState_usuarios_agregar createState() => _MyHomePageState_usuarios_agregar();
}

class _MyHomePageState_usuarios_agregar extends State<MyHomePage_usuarios_agregar> {

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController mailController = TextEditingController();

  void _registrarUsuario() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      ap.registrarUsuario(nameController.text, int.parse(ageController.text), mailController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            TextField (
              controller: nameController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Nombre de usuario',
                  hintText: 'Introduzca el nombre de usuario'
              ),
            ),

            TextField (
              controller: ageController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Edad del usuario',
                  hintText: 'Introduzca la edad de usuario'
              ),
            ),

            TextField (
              controller: mailController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Correo del usuario',
                  hintText: 'Introduzca el correo del usuario'
              ),
            ),

            ElevatedButton(
              onPressed: () {
                _registrarUsuario();

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage_usuarios(title: "Página Usuarios")),
                  );
                },
              child: Text('AGREGAR USUARIO'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('<-- VOLVER'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage_usuarios_eliminar extends StatefulWidget {
  MyHomePage_usuarios_eliminar({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState_usuarios_eliminar createState() => _MyHomePageState_usuarios_eliminar();
}

class _MyHomePageState_usuarios_eliminar extends State<MyHomePage_usuarios_eliminar> {
  List<Usuario> usuarios = ap.mostrarUsuarios();

  TextEditingController mailUsuarioController = TextEditingController();

  void _eliminarUsuario() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

      bool continuar = true;
      Usuario usuario;

      for(int i = 0; i < usuarios.length && continuar; i++){
        if(usuarios.elementAt(i).getCorreo() == mailUsuarioController.text){
          usuario = usuarios.elementAt(i);
          continuar = false;
        }
      }

      if(!continuar){
        ap.eliminarUsuario(usuario);
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[


            TextField (
              controller: mailUsuarioController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Correo del dueño',
                  hintText: 'Introduzca el correo del dueño'
              ),
            ),

            ElevatedButton(
              onPressed: () {
                _eliminarUsuario();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_usuarios(title: "Página Usuarios")),
                );
              },
              child: Text('ELIMINAR USUARIO'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_usuarios(title: "Página Usuarios")),
                );
              },
              child: Text('<-- VOLVER'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage_paseadores extends StatefulWidget {
  MyHomePage_paseadores({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState_paseadores createState() => _MyHomePageState_paseadores();
}

class _MyHomePageState_paseadores extends State<MyHomePage_paseadores> {
  List<Paseador> paseadores = ap.mostrarPaseadores();
  String informacion = "";

  String _mostrarPaseadores() {
    String aux = "";

    for(int i = 0; i < paseadores.length; i++) {
      aux += "Nombre: " + paseadores.elementAt(i).getNombre() + "  ";
      aux += "Edad: " + paseadores.elementAt(i).getEdad().toString() + "  ";
      aux += "Correo electrónico: " + paseadores.elementAt(i).getCorreo() + "\n";
    }

    setState(() {
      informacion = aux;
    });

    return informacion;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              _mostrarPaseadores(),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_paseadores_agregar(title: "Página Agregar Paseadores")),
                );
              },
              child: Text('AÑADIR PASEADOR'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_paseadores_eliminar(title: "Página Eliminar Paseadores")),
                );
              },
              child: Text('ELIMINAR PASEADOR'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_inicio(title: "Página Inicio")),
                );
              },
              child: Text('<-- VOLVER'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage_paseadores_agregar extends StatefulWidget {
  MyHomePage_paseadores_agregar({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState_paseadores_agregar createState() => _MyHomePageState_paseadores_agregar();
}

class _MyHomePageState_paseadores_agregar extends State<MyHomePage_paseadores_agregar> {

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController mailController = TextEditingController();

  void _registrarPaseador() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      ap.registrarPaseador(nameController.text, int.parse(ageController.text), mailController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            TextField (
              controller: nameController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Nombre de paseador',
                  hintText: 'Introduzca el nombre de paseador'
              ),
            ),

            TextField (
              controller: ageController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Edad del paseador',
                  hintText: 'Introduzca la edad de paseador'
              ),
            ),

            TextField (
              controller: mailController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Correo del paseador',
                  hintText: 'Introduzca el correo del paseador'
              ),
            ),

            ElevatedButton(
              onPressed: () {
                _registrarPaseador();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_paseadores(title: "Página Paseadores")),
                );
              },
              child: Text('AGREGAR PASEADOR'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('<-- VOLVER'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage_paseadores_eliminar extends StatefulWidget {
  MyHomePage_paseadores_eliminar({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState_paseadores_eliminar createState() => _MyHomePageState_paseadores_eliminar();
}

class _MyHomePageState_paseadores_eliminar extends State<MyHomePage_paseadores_eliminar> {
  List<Paseador> paseadores = ap.mostrarPaseadores();

  TextEditingController mailUsuarioController = TextEditingController();

  void _eliminarPaseador() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

      bool continuar = true;
      Paseador usuario;

      for(int i = 0; i < paseadores.length && continuar; i++){
        if(paseadores.elementAt(i).getCorreo() == mailUsuarioController.text){
          usuario = paseadores.elementAt(i);
          continuar = false;
        }
      }

      if(!continuar){
        ap.eliminarPaseador(usuario);
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[


            TextField (
              controller: mailUsuarioController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Correo del paseador',
                  hintText: 'Introduzca el correo del paseador'
              ),
            ),

            ElevatedButton(
              onPressed: () {
                _eliminarPaseador();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_paseadores(title: "Página Paseadores")),
                );
              },
              child: Text('ELIMINAR PASEADOR'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_paseadores(title: "Página Paseadores")),
                );
              },
              child: Text('<-- VOLVER'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage_zonas extends StatefulWidget {
  MyHomePage_zonas({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState_zonas createState() => _MyHomePageState_zonas();
}

class _MyHomePageState_zonas extends State<MyHomePage_zonas> {
  List<Zona> zonas = ap.mostrarZonas();
  String informacion = "";

  String _mostrarZonas() {
    String aux = "";

    for(int i = 0; i < zonas.length; i++) {
      aux += "Nombre zona: " + zonas.elementAt(i).getNombre() + "  ";
      aux += "Ciudad zona: " + zonas.elementAt(i).getCiudad() + "\n";
    }

    setState(() {
      informacion = aux;
    });

    return informacion;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              _mostrarZonas(),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_zonas_agregar(title: "Página Zonas Paseadores")),
                );
              },
              child: Text('AÑADIR ZONA'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_zonas_eliminar(title: "Página Eliminar Zonas")),
                );
              },
              child: Text('ELIMINAR ZONA'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_inicio(title: "Página Inicio")),
                );
              },
              child: Text('<-- VOLVER'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage_zonas_agregar extends StatefulWidget {
  MyHomePage_zonas_agregar({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState_zonas_agregar createState() => _MyHomePageState_zonas_agregar();
}

class _MyHomePageState_zonas_agregar extends State<MyHomePage_zonas_agregar> {

  TextEditingController nameController = TextEditingController();
  TextEditingController ciudadController = TextEditingController();


  void _registrarZona() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      ap.registrarZona(nameController.text, ciudadController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            TextField (
              controller: nameController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Nombre de la zona',
                  hintText: 'Introduzca el nombre de la zona'
              ),
            ),

            TextField (
              controller: ciudadController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Ciudad de la zona',
                  hintText: 'Introduzca la ciudad de la zona'
              ),
            ),


            ElevatedButton(
              onPressed: () {
                _registrarZona();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_zonas(title: "Página Zona")),
                );
              },
              child: Text('AGREGAR ZONA'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('<-- VOLVER'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage_zonas_eliminar extends StatefulWidget {
  MyHomePage_zonas_eliminar({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState_zonas_eliminar createState() => _MyHomePageState_zonas_eliminar();
}

class _MyHomePageState_zonas_eliminar extends State<MyHomePage_zonas_eliminar> {
  List<Zona> zonas = ap.mostrarZonas();

  TextEditingController nombreController = TextEditingController();

  void _eliminarPaseador() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

      bool continuar = true;
      Zona usuario;

      for(int i = 0; i < zonas.length && continuar; i++){
        if(zonas.elementAt(i).getNombre() == nombreController.text){
          usuario = zonas.elementAt(i);
          continuar = false;
        }
      }

      if(!continuar){
        ap.eliminarZona(usuario);
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[


            TextField (
              controller: nombreController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Nombre de la zona',
                  hintText: 'Introduzca el nombre de la zona'
              ),
            ),

            ElevatedButton(
              onPressed: () {
                _eliminarPaseador();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_zonas(title: "Página Zonas")),
                );
              },
              child: Text('ELIMINAR ZONA'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage_zonas(title: "Página Zonas")),
                );
              },
              child: Text('<-- VOLVER'),
            ),
          ],
        ),
      ),
    );
  }
}
