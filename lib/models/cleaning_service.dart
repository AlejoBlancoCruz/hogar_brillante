class CleaningService {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  const CleaningService({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

class ServiceRequest {
  final String name;
  final String lastName;
  final String phone;
  final String email;
  final List<String> selectedServices;
  final Map<String, String> serviceDetails;
  final DateTime createdAt;

  const ServiceRequest({
    required this.name,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.selectedServices,
    required this.serviceDetails,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lastName': lastName,
      'phone': phone,
      'email': email,
      'selectedServices': selectedServices,
      'serviceDetails': serviceDetails,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}