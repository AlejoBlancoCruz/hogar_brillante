// servicio_form_page.dart

import 'package:flutter/material.dart';
import 'package:hogar_brillante/model/servicio_model.dart'; // Importamos la clase Servicio

class ServicioFormPage extends StatefulWidget {
  final Servicio? servicio;
  final Function(Servicio) onSave; // La función de callback que guarda en Xano

  const ServicioFormPage({
    super.key,
    this.servicio,
    required this.onSave,
  });

  @override
  State<ServicioFormPage> createState() => _ServicioFormPageState();
}

class _ServicioFormPageState extends State<ServicioFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _imagenController = TextEditingController();
  bool _seleccionado = false;

  @override
  void initState() {
    super.initState();
    if (widget.servicio != null) {
      // Si estamos editando, precargamos los datos
      _tituloController.text = widget.servicio!.titulo;
      _descripcionController.text = widget.servicio!.descripcion;
      _imagenController.text = widget.servicio!.imagen;
      _seleccionado = widget.servicio!.seleccionado;
    }
  }

  @override
  void dispose() {
    _tituloController.dispose();
    _descripcionController.dispose();
    _imagenController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Creamos el objeto Servicio con los datos capturados
      final newServicio = Servicio(
        id: widget.servicio?.id, // Mantiene el ID si estamos actualizando
        titulo: _tituloController.text,
        descripcion: _descripcionController.text,
        imagen: _imagenController.text,
        seleccionado: _seleccionado,
      );

      // Ejecutamos la función onSave (el callback a la página principal)
      widget.onSave(newServicio);

      // Cerramos el formulario
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.servicio == null ? 'Crear Servicio' : 'Editar Servicio'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _tituloController,
                decoration: const InputDecoration(labelText: 'Título'),
                validator: (value) => value == null || value.isEmpty
                    ? 'Ingrese un título.'
                    : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _descripcionController,
                decoration: const InputDecoration(labelText: 'Descripción'),
                maxLines: 3,
                validator: (value) => value == null || value.isEmpty
                    ? 'La descripción es obligatoria.'
                    : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _imagenController,
                decoration: const InputDecoration(labelText: 'URL de Imagen'),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Text('Seleccionado:'),
                  Checkbox(
                    value: _seleccionado,
                    onChanged: (bool? newValue) {
                      setState(() {
                        _seleccionado = newValue ?? false;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(widget.servicio == null
                    ? 'Guardar Servicio'
                    : 'Actualizar Servicio'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
