import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:http/http.dart' as http;

import '../home.dart';

const List<String> listSexo = <String>['Masculino', 'Femenino', 'Otro'];
void main() => runApp(const SignUp());

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  static const String _title = 'Sign Up';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = listSexo.first;
  TextEditingController fnameController = TextEditingController();
  TextEditingController lFnameController = TextEditingController();
  TextEditingController lMnameController = TextEditingController();
  TextEditingController cpController = TextEditingController();
  TextEditingController Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'AFF',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              //FIELD
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: fnameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombre',
                ),
              ),
            ), // FIELD
            Container(
              //FIELD
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: lFnameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Apellido Paterno',
                ),
              ),
            ), // FIELD
            Container(
              //FIELD
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: lMnameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Apellido Materno',
                ),
              ),
            ), // FIELD
            Container(
              //FIELD
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: cpController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Codigo Postal',
                ),
              ),
            ), // FIELD
            Container(
              //FIELD
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: Controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Fecha de nacimiento',
                ),
              ),
            ), // FIELD
            Container(
              //FIELD
              padding: const EdgeInsets.all(10),
              child: PasswordField(
                color: Colors.blue,
                passwordConstraint: r'[0-9]',
                inputDecoration: PasswordDecoration(),
                hintText: 'Password',
                border: PasswordBorder(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue.shade100,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue.shade100,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(width: 2, color: Colors.red.shade200),
                  ),
                ),
                errorMessage: 'Esta vacio el campo',
              ),
            ), // FIELD
            Container(
              //FIELD
              padding: const EdgeInsets.all(10),
              child: DropdownButton<String>(
                value: dropdownValue,
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Color.fromARGB(255, 29, 51, 112),
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: listSexo.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ), // FIELD
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('SignUp'),
                  onPressed: () {
                    login();
                  },
                )),
          ],
        ));
  }

  Future<void> login() async {
    if (dropdownValue.isNotEmpty &&
        fnameController.text.isNotEmpty &&
        lFnameController.text.isNotEmpty &&
        lMnameController.text.isNotEmpty &&
        cpController.text.isNotEmpty &&
        Controller.text.isNotEmpty) {
      Map data = {
        'id': 3,
        'nombre': fnameController.text,
        "apellidopa": lFnameController.text,
        "apellidoma": lMnameController.text,
        "cp": cpController.text,
        "fecha": Controller.text,
        "sexo": dropdownValue,
        "idusuario": 3
      };
      String body = json.encode(data);
      var response = await http.post(
          Uri.parse(
              "https://qcbhe1w262.execute-api.us-east-2.amazonaws.com/default/registro"),
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
