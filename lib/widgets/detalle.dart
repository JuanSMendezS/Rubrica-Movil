import 'package:sqlite_crud/widgets/producto.dart';
import 'package:flutter/material.dart';
import 'package:sqlite_crud/widgets/Ruta.dart';
import 'package:sqlite_crud/widgets/editar.dart';
import 'package:http/http.dart' as http;

class Detalle extends StatefulWidget {
  final Producto producto;

  const Detalle({super.key, required this.producto});

  @override
  State<Detalle> createState() => _DetalleState();
}

class _DetalleState extends State<Detalle> {
  void eliminarProducto(context) async {
    await http.post(Uri.parse(Ruta.dirServerEliminar),
        body: {'id': widget.producto.id.toString()});
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  void confirmacion(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text("¿ Deseas eliminar este cliente ?"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.cancel)),
              ElevatedButton(
                  onPressed: () {
                    eliminarProducto(context);
                  },
                  child: const Icon(Icons.check_circle)),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detalles Cliente"),
          actions: [
            IconButton(
                onPressed: () {
                  confirmacion(context);
                },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Text("NOMBRE: ${widget.producto.nombre}"),
              Text("APELLIDOS: ${widget.producto.apellidos}"),
              Text("CORREO: ${widget.producto.correo}"),
              Text("GENERO: ${widget.producto.genero}"),
              Text("ROLE: ${widget.producto.rol}"),
              Text("TELEFONO: ${widget.producto.telefono}"),
              Text("PASSWPRD: ${widget.producto.password}")
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return Editar(producto: widget.producto);
              }));
            }));
  }
}
