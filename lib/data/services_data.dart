import 'package:hogar_brillante/models/cleaning_service.dart';

class ServicesData {
  static const List<CleaningService> services = [
    CleaningService(
      id: 'office',
      name: 'Limpieza de Oficinas',
      description: 'Servicio profesional de limpieza para espacios corporativos y oficinas. Incluye limpieza de escritorios, baños, áreas comunes y mantenimiento de espacios de trabajo.',
      imageUrl: 'https://pixabay.com/get/gab1ed23d1a82acdee9fa6d0202944b69c58fe9c1f2563b6e8f97b6a943eae63fd3c4279a52513c774dc7fbe8626efaa29ffe589161bcd464d518787052d889fc_1280.jpg',
    ),
    CleaningService(
      id: 'home',
      name: 'Limpieza de Hogares',
      description: 'Servicio integral de limpieza doméstica para tu hogar. Incluye limpieza de habitaciones, cocina, baños, aspirado y mantenimiento general de la casa.',
      imageUrl: 'https://pixabay.com/get/g604b9c32f7b453768f43e81967e4c7c2c90495a06d5bb8b7aca80e05d58cee0a0ba2dab809744c66d79aaa2afb96f5345a691afc8775d5c1a8fc4ab3d2de2bfb_1280.jpg',
    ),
    CleaningService(
      id: 'furniture',
      name: 'Limpieza de Muebles',
      description: 'Servicio especializado en limpieza de muebles y tapicería. Incluye limpieza profunda de sofás, sillas, alfombras y otros elementos de mobiliario.',
      imageUrl: 'https://pixabay.com/get/g761eb3d8590b6fb360c7a30ae9f312474dad7c957a8cca498532168ab3a44c1e25e0039a01c61662859d9fda9292066bc640b402b55ad6c2aa65b8ee8e3a7f82_1280.jpg',
    ),
  ];

  static CleaningService? getServiceById(String id) {
    try {
      return services.firstWhere((service) => service.id == id);
    } catch (e) {
      return null;
    }
  }
}