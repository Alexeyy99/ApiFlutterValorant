import 'package:clash/api/api_http.dart';
import 'package:clash/controllers/valorant_controller.dart';
import 'package:clash/pages/detalles_agente.dart';
import 'package:clash/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.lazyPut(() => ApiHttp());
  Get.lazyPut(() => ValorantController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      title: 'Articulos del espacio',
      routes: {
        '/home': (context) => const HomePage(),
        '/detalles/agente': (context) => DetalleAgente()
      },
    );
  }
}
