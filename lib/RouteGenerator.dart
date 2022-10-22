import 'package:flutter/material.dart';
import 'package:hackhatonlogin/Logins/loginNormal.dart';
import 'package:hackhatonlogin/Logins/loginQR.dart';
import 'package:hackhatonlogin/PageLoading.dart';
import 'package:hackhatonlogin/Logins/loginVibracion.dart';
import 'package:hackhatonlogin/SplashScreen/SplashScreen.dart';
import 'package:hackhatonlogin/SignUp/SignUp.dart';

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
      case '/vibracion':
        return MaterialPageRoute(builder: (context) => LoginVibracion());
      case '/sp':
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case '/rg':
        return MaterialPageRoute(builder: (context) => SignUp());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
          appBar: AppBar(
            title: Text('ERROR'),
            centerTitle: true,
          ),
          body: Center(
            child: Text('No encontrado'),
          ));
    });
  }
}
