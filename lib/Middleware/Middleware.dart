import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hackhatonlogin/SignUp/SignUp.dart';
import 'package:hackhatonlogin/modelos/ml.class.dart';
import 'package:http/http.dart' as http;

class Middleware extends StatefulWidget {
  const Middleware({Key? key}) : super(key: key);

  @override
  State<Middleware> createState() => _MiddlewareState();
}

class _MiddlewareState extends State<Middleware> {
  String idUsuario = "909HGM1R";
  @override
  void initState() {
    // TODO: implement setState
    super.initState();
    verificaLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 29, 51, 112),
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.grey,
          size: 80.0,
        ),
      ),
    );
  }

  Future<void> verificaLogin() async {
    ml mld = new ml(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    if (idUsuario != null) {
      var response = await http.get(
        Uri.parse(
            "http://ec2-13-59-38-221.us-east-2.compute.amazonaws.com:5000/?user=" +
                idUsuario),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        dynamic data = json.decode(response.body);
        mld = ml.fromJson(data);
        if (mld.acc == 1.0) {
          if (mld.ver == 1.0 && mld.escuchar == 1.0 || mld.ver == 1.0) {
            Timer(
                Duration(seconds: 3),
                () => Navigator.of(context)
                    .pushNamed('/vibracion', arguments: ''));
          } else if (mld.recordar == 1.0 || mld.mental == 1.0) {
            Timer(Duration(seconds: 3),
                () => Navigator.of(context).pushNamed('/qr', arguments: ''));
          }
        } else {
          Timer(Duration(seconds: 3),
              () => Navigator.of(context).pushNamed('/normal', arguments: ''));
        }
      } else {
        Timer(Duration(seconds: 3),
            () => Navigator.of(context).pushNamed('/rg', arguments: ''));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error, campos en blanco")));
    }
  }
}
