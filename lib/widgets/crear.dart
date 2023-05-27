import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Ruta.dart';

class Crear extends StatefulWidget {
  const Crear({super.key});

  @override
  State<Crear> createState() => _CrearState();
}

class _CrearState extends State<Crear> {
  TextEditingController cNombre = TextEditingController();
  TextEditingController cApellidos = TextEditingController();
  TextEditingController cCorreo = TextEditingController();
  TextEditingController cGenero = TextEditingController();
  TextEditingController cRol = TextEditingController();
  TextEditingController cTelefono = TextEditingController();
  TextEditingController cPassword = TextEditingController();

  Future crearProducto(context) async {
    await http.post(Uri.parse(Ruta.dirServerRegistrar), body: {
      'nombre': cNombre.text,
      'apellidos': cApellidos.text,
      'correo': cCorreo.text,
      'genero': cGenero.text,
      'rol': cRol.text,
      'telefono': cTelefono.text,
      'password': cPassword.text
    });
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar Cliente"),
        elevation: 0,
        toolbarHeight: 40,
        titleSpacing: 10.5,
        centerTitle: true,
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            side: BorderSide(color: Colors.amber)),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: cNombre,
            decoration: const InputDecoration(labelText: "Nombre"),
          ),
          TextFormField(
            controller: cApellidos,
            decoration: const InputDecoration(labelText: "Apellido(s)"),
          ),
          TextFormField(
            controller: cCorreo,
            decoration: const InputDecoration(labelText: "Correo"),
          ),
          TextFormField(
            controller: cGenero,
            decoration: const InputDecoration(labelText: "Genero"),
          ),
          TextFormField(
            controller: cRol,
            decoration: const InputDecoration(labelText: "Rol"),
          ),
          TextFormField(
            controller: cTelefono,
            decoration: const InputDecoration(labelText: "Telefono"),
          ),
          TextFormField(
            controller: cPassword,
            decoration: const InputDecoration(labelText: "Contraseña"),
          ),
          ElevatedButton(
              onPressed: () {
                crearProducto(context);
              },
              child: const Text("Guardar"))
        ],
      ),
    );
  }
}
