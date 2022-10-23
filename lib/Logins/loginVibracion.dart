import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:audioplayers/audioplayers.dart';

class LoginVibracion extends StatefulWidget {
  const LoginVibracion({super.key});

  @override
  State<LoginVibracion> createState() => _LoginVibracionState();
}

class _LoginVibracionState extends State<LoginVibracion> {
  String textoEjemplo = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 29, 51, 112),
        body: Container(
          padding: const EdgeInsets.only(
            left: 37,
            right: 38,
            top: 100,
            bottom: 150,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 200),
              Center(
                child: Container(
                  width: 268,
                  height: 49,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.white),
                  child: Center(
                    child: Text(
                      textoEjemplo,
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 70),
              Center(
                child: Container(
                  width: 319,
                  height: 201,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 250,
                        height: 400,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                          ),
                          onPressed: () => _testNuevo(context),
                          child: Text(
                            'Presionar',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 29, 51, 112)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  _testNuevo(BuildContext context) async {
    final player = AudioPlayer();
    await player.play(UrlSource(
        'https://mdslab.com.mx/wp-content/uploads/2022/10/SD_ALERT_24-mp3cut.net-1.mp3'));
    setState(() {
      if (textoEjemplo.length < 8) {
        Vibration.vibrate();

        this.textoEjemplo = this.textoEjemplo + '*';
      }
      if (textoEjemplo.length == 8) {
        Navigator.of(context).pushNamed('/', arguments: '');
      }
    });
  }
}
