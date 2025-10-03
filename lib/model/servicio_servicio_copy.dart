import 'package:http/http.dart' as http;
import 'dart:convert';
import 'servicio_model.dart';

class ServicioService {
  static const String _urlBase =
      'https://x8ki-letl-twmt.n7.xano.io/api:_ngFc-kT/servicios_limpieza';

  Future<List<Servicio>> obtenerServicios() async {
    try {
      final response = await http.get(Uri.parse(_urlBase));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Servicio.fromJson(json)).toList();
      } else {
        throw Exception(
          'Error al cargar los servicios: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
}
