import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hackhatonlogin/SignUp/SignUp.dart';

class Middleware extends StatefulWidget {
  const Middleware({Key? key}) : super(key: key);

  @override
  State<Middleware> createState() => _MiddlewareState();
}

class _MiddlewareState extends State<Middleware> {
  @override
  void initState() {
    // TODO: implement setState
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => SignUp())));
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
}
