import 'package:flutter/material.dart';
//import 'package:hogar_brillante/pages/sevices_crud_page.dart';
import 'package:hogar_brillante/theme.dart';
//import 'package:hogar_brillante/pages/home_page.dart';
import 'package:hogar_brillante/pages/services_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Servicios de Limpieza Alpha ',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      //home: Scaffold(body: ServicioCrudPage()),
      home: Scaffold(body: const ServiciosListView()),
    );
  }
}
