import 'package:flutter/material.dart';
import 'package:hackhatonlogin/RouteGenerator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/rg',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
