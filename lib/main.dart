import 'package:flutter/material.dart';
import 'package:sqlite_crud/theme/app_theme.dart';
import 'widgets/inicio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto',
      theme: AppTheme.darktheme,
      initialRoute: "/",
      routes: {
        "/": (context) => const Inicio(),
      },
    );
  }
}
