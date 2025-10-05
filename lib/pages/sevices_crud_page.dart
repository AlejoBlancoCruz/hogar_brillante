// servicios_crud_page.dart

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hogar_brillante/model/servicio_model.dart'; // Importa el modelo
import 'package:hogar_brillante/pages/services_form_page.dart'; // Importa el formulario

// ¡IMPORTANTE! Reemplaza esto con tu URL base de Xano
const String xanoBaseUrl = 'https://xw00-0000.xano.io/api:abc/servicio';

class ServicioCrudPage extends StatefulWidget {
  const ServicioCrudPage({super.key});

  @override
  State<ServicioCrudPage> createState() => _ServicioCrudPageState();
}

class _ServicioCrudPageState extends State<ServicioCrudPage> {
  late Future<List<Servicio>> _serviciosFuture;

  @override
  void initState() {
    super.initState();
    // Inicia la lectura de datos (READ)
    _serviciosFuture = _fetchServicios();
  }

  // R - READ (Leer todos)
  Future<List<Servicio>> _fetchServicios() async {
    final response = await http.get(Uri.parse(
        'https://x8ki-letl-twmt.n7.xano.io/api:_ngFc-kT/servicios_limpieza'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => Servicio.fromJson(item)).toList();
    } else {
      throw Exception('Fallo al cargar los servicios de Xano');
    }
  }

  // C - CREATE / U - UPDATE
  Future<void> _saveServicio(Servicio servicio) async {
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(servicio.toJson());
    String url;

    if (servicio.id == null) {
      // CREATE: Petición POST
      url = xanoBaseUrl;
      await http.post(Uri.parse(url), headers: headers, body: body);
    } else {
      // UPDATE: Petición POST/PATCH al ID específico
      url = '$xanoBaseUrl/${servicio.id}';
      await http.post(Uri.parse(url), headers: headers, body: body);
    }

    // Recarga la lista para ver los cambios
    setState(() {
      _serviciosFuture = _fetchServicios();
    });
  }

  // D - DELETE (Borrar)
  Future<void> _deleteServicio(int id) async {
    final url = '$xanoBaseUrl/$id';
    await http.delete(Uri.parse(url));

    // Recarga la lista para ver los cambios
    setState(() {
      _serviciosFuture = _fetchServicios();
    });
  }

  // Función para navegar al formulario y pasar el callback _saveServicio
  void _openServicioForm({Servicio? servicio}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ServicioFormPage(
          servicio: servicio,
          onSave: _saveServicio, // ¡Pasa el callback!
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CRUD Servicios Xano')),
      body: FutureBuilder<List<Servicio>>(
        future: _serviciosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay servicios disponibles.'));
          }

          // Muestra la lista de servicios (READ)
          final servicios = snapshot.data!;
          return ListView.builder(
            itemCount: servicios.length,
            itemBuilder: (context, index) {
              final servicio = servicios[index];
              return ListTile(
                title: Text(servicio.titulo),
                subtitle: Text(servicio.descripcion),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // EDITAR (UPDATE)
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => _openServicioForm(servicio: servicio),
                    ),
                    // BORRAR (DELETE)
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteServicio(servicio.id!),
                    ),
                  ],
                ),
                onTap: () => _openServicioForm(servicio: servicio),
              );
            },
          );
        },
      ),
      // Botón para CREAR (CREATE)
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openServicioForm(),
      ),
    );
  }
}
