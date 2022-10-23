import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hackhatonlogin/RouteGenerator.dart';
import 'package:hackhatonlogin/home.dart';
import 'package:http/http.dart' as http;

class LoginNormal extends StatefulWidget {
  const LoginNormal({Key? key}) : super(key: key);

  @override
  State<LoginNormal> createState() => _LoginNormalState();
}

class _LoginNormalState extends State<LoginNormal> {
  final idUsuario = TextEditingController();
  final contra = TextEditingController();

  @override
  void dispose() {
    idUsuario.dispose();
    contra.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[700],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Autentificación Normal',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: idUsuario,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Id Usuario',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: contra,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Contraseña',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  login();
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                    child: Text(
                      'Ingresar',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ));
  }

  Future<void> login() async {
    if (idUsuario.text.isNotEmpty && contra.text.isNotEmpty) {
      Map data = {'id': idUsuario.text, 'contraseña': contra.text};
      String body = json.encode(data);
      var response = await http.post(
          Uri.parse(
              "https://wkw7pruewa.execute-api.us-east-2.amazonaws.com/devLogin"),
          headers: {"Content-Type": "application/json"},
          body: body);
      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => home()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error, contraseña o usuario incorrecto")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error, campos en blanco")));
    }
  }
}
