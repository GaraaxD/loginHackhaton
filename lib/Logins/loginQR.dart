import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hackhatonlogin/qr/mainQR.dart';

import '../home.dart';

class LoginQR extends StatefulWidget {
  const LoginQR({Key? key}) : super(key: key);

  @override
  State<LoginQR> createState() => _LoginQRState();
}

class _LoginQRState extends State<LoginQR> {
  String codigoQR = 'En espera...';
  bool estadoQR = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff586286),
        body: Container(
          padding: const EdgeInsets.only(
            left: 37,
            right: 38,
            top: 33,
            bottom: 200,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 100,
                    height: 63,
                    child: Text(
                      "Login \npor QR\n",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(width: 100),
                  SizedBox(
                    child: Icon(
                      Icons.qr_code_outlined,
                      size: 75,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 233),
              Center(
                child: Container(
                  width: 319,
                  height: 101,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff26387a),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ),
                        onPressed: () => _navegarAlEscanner(context),
                        child: Text(
                          'Escanear QR',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )

        /*Card(
                  elevation: 10.0,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: SingleChildScrollView(
                      child: Text(
                        codigoQR,
                        style: TextStyle(
                            fontSize: 18,
                            color: (!estadoQR) ? Colors.black26 : Colors.black),
                      ),
                    ),
                  ),
                ),*/
        );
  }

  _navegarAlEscanner(BuildContext context) async {
    this.codigoQR = 'Aún no se ha escaneado un código...';
    this.estadoQR = false;
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => mainQR()),
    );
    setState(() {
      if (result != null) {
        login(result);
        this.estadoQR = true;
      }
    });
  }

  Future<void> login(String result) async {
    if (result.isNotEmpty) {
      String body = json.encode(result);
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
