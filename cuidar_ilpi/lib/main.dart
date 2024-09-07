import 'package:flutter/material.dart';
import 'package:cuidar_ilpi/pages/longinEsingUp_screen/login_screen.dart';
import 'package:cuidar_ilpi/pages/longinEsingUp_screen/singUp_screen.dart';
import 'package:cuidar_ilpi/pages/home/home_page.dart';
import 'package:cuidar_ilpi/pages/monitoramento/monitoring_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/login': (context) => const LoginScreen(),
        '/sign_up': (context) => const signUpScreen(),
        '/home': (context) => const MyHomePage(),
        '/monitoring':(context) => const MonitoringScreen(),
      },
    );
  }
}