class Producto {
  final int id;
  final String nombre;
  final String apellidos;
  final String correo;
  final String genero;
  final String rol;
  final int telefono;
  final String password;

  Producto({
    required this.id,
    required this.nombre,
    required this.apellidos,
    required this.correo,
    required this.genero,
    required this.rol,
    required this.telefono,
    required this.password,
  });

  factory Producto.fromJSON(Map<String, dynamic> json) {
    return Producto(
      id: int.parse(json["CLI_ID"]),
      nombre: json["CLI_NOMBRE"],
      apellidos: json["CLI_APELLIDOS"],
      correo: json["CLI_CORREO"],
      genero: json["CLI_GENERO"],
      rol: json["CLI_ROL"],
      telefono: int.parse(json["CLI_TELEFONO"]),
      password: json["CLI_PASSWORD"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellidos": apellidos,
        "correo": correo,
        "genero": genero,
        "rol": rol,
        "telefono": telefono,
        "password": password,
      };

  static Future<List<Producto>> fromJson(dynamic json) async {
    if (json is List) {
      return json.map((item) => Producto.fromJSON(item)).toList();
    } else {
      return [];
    }
  }
}
