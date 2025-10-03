class Servicio {
  final String imagen;
  final String titulo;
  final String descripcion;
  bool seleccionado;
  final int? id;

  Servicio({
    required this.imagen,
    required this.titulo,
    required this.descripcion,
    this.seleccionado = false,
    required this.id,
  });

  factory Servicio.fromJson(Map<String, dynamic> json) {
    return Servicio(
      imagen: json['imagen'] ?? 'assets/image/default.png',
      titulo: json['titulo'],
      descripcion: json['descripcion'],
      seleccionado: json['seleccionado'] ?? false,
      id: json['id'],
    );
  }
}
