import 'package:flutter/material.dart';
import 'package:hackhatonlogin/qr/mainQR.dart';

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
        body: Stack(
          children: [
            Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
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
                                color: (!estadoQR)
                                    ? Colors.black26
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                      ),
                      onPressed: () => _navegarAlEscanner(context),
                      child: Text(
                        'Escanear QR',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ));
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
        this.codigoQR = result;
        this.estadoQR = true;
      }
    });
  }
}



