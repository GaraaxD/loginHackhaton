import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:hold_down_button/hold_down_button.dart';

class LoginVibracion extends StatefulWidget {
  const LoginVibracion({super.key});

  @override
  State<LoginVibracion> createState() => _LoginVibracionState();
}

class _LoginVibracionState extends State<LoginVibracion> {
  String textoEjemplo = "";
  int t = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff586286),
        body: Container(
          padding: const EdgeInsets.only(
            left: 37,
            right: 38,
            top: 33,
            bottom: 150,
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
                    width: 140,
                    height: 100,
                    child: Text(
                      "Login \npor Vibración\n",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(width: 100),
                  SizedBox(
                    child: Icon(
                      Icons.remove_red_eye,
                      size: 75,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 150),
              Center(
                child: Container(
                  width: 268,
                  height: 49,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.white),
                  child: Center(
                    child: Text(
                      t.toString(),
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
                      HoldDownButton(
                        onHoldDown: _testNuevo,
                        child: SizedBox(
                          width: 230,
                          height: 204,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff26387a),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                            ),
                            onPressed: () => _testNuevo(),
                            child: Text(
                              'Presionar',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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

  void _testNuevo() async {
    final player = AudioPlayer();
    await player.play(UrlSource(
        'https://mdslab.com.mx/wp-content/uploads/2022/10/SD_ALERT_24-mp3cut.net-1.mp3'));
    setState(() {
      Vibration.vibrate(amplitude: 500);

      t++;
      /*if (textoEjemplo.length < 8) {
       
      }*/
      /*if (textoEjemplo.length == 8) {
        Navigator.of(context).pushNamed('/', arguments: '');
      }*/
    });
  }
}
