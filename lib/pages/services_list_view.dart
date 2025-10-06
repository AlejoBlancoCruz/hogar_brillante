import 'package:flutter/material.dart';
import 'package:hogar_brillante/model/servicio_model.dart';
import 'package:hogar_brillante/model/servicio_servicio.dart';
import 'package:hogar_brillante/widgets/company_logo.dart';

class ServiciosListView extends StatefulWidget {
  const ServiciosListView({super.key});

  @override
  State<ServiciosListView> createState() => _ServiciosListViewState();
}

class _ServiciosListViewState extends State<ServiciosListView> {
  final ServicioService _servicioService = ServicioService();
  List<Servicio> servicios = [];
  bool isLoading = true;
  final Set<int> _serviciosSeleccionados = {};

  @override
  void initState() {
    super.initState();
    _cargarServicios();
  }

  Future<void> _cargarServicios() async {
    try {
      final listaServicios = await _servicioService.obtenerServicios();
      if (mounted) {
        // Verifica que el widget aún esté montado
        setState(() {
          servicios = listaServicios;
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        // Verifica que el widget aún esté montado
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar servicios: $e')),
        );
      }
    }
  }

  void _onPressed() {
    //bool algunoSeleccionado = servicios.any((s) => s.seleccionado);
    if (_serviciosSeleccionados.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Botón pulsado: hay servicios seleccionados'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debe elegir al menos un servicio')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: CompanyLogo(
          fontSize: 25,
          textColor: theme.colorScheme.onPrimary,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: servicios.length,
                    itemBuilder: (context, index) {
                      final servicio = servicios[index];
                      if (servicio.id == null) return const SizedBox.shrink();
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        child: SizedBox(
                          height: 250,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.network(
                                  servicio.imagen,
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blue,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[200],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                        ),
                                        child: Text(
                                          servicio.titulo,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                        ),
                                        child: Text(
                                          servicio.descripcion,
                                          style: const TextStyle(fontSize: 16),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    value: _serviciosSeleccionados
                                        .contains(servicio.id),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value == true) {
                                          _serviciosSeleccionados
                                              .add(servicio.id!);
                                        } else {
                                          _serviciosSeleccionados
                                              .remove(servicio.id!);
                                        }
                                        //servicio.seleccionado = value ?? false;
                                      });
                                    },
                                  ),
                                  const Text(
                                    'Click aquí para seleccionar',
                                    style: TextStyle(fontSize: 12),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _onPressed,
              child: const Text('Contratar servicio'),
            ),
          ),
        ],
      ),
    );
  }
}
