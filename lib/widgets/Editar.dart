import 'package:sqlite_crud/widgets/producto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Ruta.dart';

class Editar extends StatefulWidget {
  final Producto producto;
  const Editar({super.key, required this.producto});

  @override
  State<Editar> createState() => _EditarState();
}

class _EditarState extends State<Editar> {
  TextEditingController cNombre = TextEditingController();
  TextEditingController cApellidos = TextEditingController();
  TextEditingController cCorreo = TextEditingController();
  TextEditingController cGenero = TextEditingController();
  TextEditingController cRol = TextEditingController();
  TextEditingController cTelefono = TextEditingController();
  TextEditingController cPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    cNombre.text = widget.producto.nombre;
    cApellidos.text = widget.producto.apellidos;
    cCorreo.text = widget.producto.correo;
    cRol.text = widget.producto.rol;
    cTelefono = widget.producto.telefono as TextEditingController;
    cPassword.text = widget.producto.password;
  }

  Future<void> editarProducto(context) async {
    await http.post(Uri.parse(Ruta.dirServerEditar), body: {
      'id': widget.producto.id.toString(),
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
        title: const Text("Editar Producto"),
        elevation: 0,
        toolbarHeight: 40,
        titleSpacing: 10.5,
        centerTitle: true,
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50))),
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
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Telefono"),
          ),
          TextFormField(
            controller: cPassword,
            decoration: const InputDecoration(labelText: "Contraseña"),
          ),
          ElevatedButton(
              onPressed: () {
                editarProducto(context);
              },
              child: const Text("Editar"))
        ],
      ),
    );
  }
}
