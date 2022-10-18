import 'package:flutter/material.dart';
import 'package:hackhatonlogin/Logins/loginNormal.dart';
import 'package:hackhatonlogin/Logins/loginQR.dart';
import 'package:hackhatonlogin/PageLoading.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => PageLoading());
      case '/normal':
        return MaterialPageRoute(builder: (context) => LoginNormal());
      case '/qr':
        return MaterialPageRoute(builder: (context) => LoginQR());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('ERROR'),
          centerTitle: true,
        ),
        body: Center(
          child: Text('No encontrado'),
        )
      );
    });
  }
}