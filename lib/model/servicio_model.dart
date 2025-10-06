class Servicio {
  final String imagen;
  final String titulo;
  final String descripcion;
  //bool seleccionado;
  final int? id;

  Servicio({
    required this.imagen,
    required this.titulo,
    required this.descripcion,
    //this.seleccionado = false,
    required this.id,
  });

  factory Servicio.fromJson(Map<String, dynamic> json) {
    return Servicio(
      imagen: json['imagen'] ?? 'assets/image/default.png',
      titulo: json['titulo'] ?? 'Sin título',
      descripcion: json['descripcion'] ?? 'Sin Descripción',
      //seleccionado: json['seleccionado'] ?? false,
      id: json['id'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      // 'id' Se genera automáticamente.
      'imagen': imagen,
      'titulo': titulo,
      'descripcion': descripcion,
    };
    if (id != null) {
      data['id'] = id;
    }
    return data;
  }
}

// Table: serv_header

// id (int, single)
// created_at (epochms, single)
// nombre (text, single)
// telefono (text, single)
// email (email, single)
// descr_servicios (text, single)

// class Solic_header {
//   final int id;
//   final int created; 
//   final String nombre;
//   final String telefono;
//   final String email;
//   final String descripcion;
  

//   Solic_header({    
//     required this.id,
//     required this.id;
//     required this.created; 
//     required this.nombre;
//     required this.telefono;
//     required this.email;
//     required this.descripcion;

//   });

//   factory Solic_header.fromJson(Map<String, dynamic> json) {
//     return Servicio(
//       imagen: json['imagen'] ?? 'assets/image/default.png',
//       titulo: json['titulo'],
//       descripcion: json['descripcion'],
//       seleccionado: json['seleccionado'] ?? false,
//       id: json['id'],
//     );
//   }
// }
