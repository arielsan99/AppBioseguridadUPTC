import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_mobile_vision/qr_camera.dart';

class ReadQR extends StatefulWidget {
  ReadQR({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<ReadQR> {
  String qr;
  bool camState = false;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _titulos(),
                SizedBox(height: 100),
                _camara(),
                _crearBotonScan(),
              ],
            ),
          )
        ],
      ),
    );
  }

  _camara() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              child: camState
                  ? Center(
                      child: SizedBox(
                        width: 650,
                        height: 800,
                        child: QrCamera(
                          onError: (context, error) => Text(
                            error.toString(),
                            style: TextStyle(color: Colors.red),
                          ),
                          qrCodeCallback: (code) {
                            setState(() {
                              qr = code;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                  color: Colors.white70,
                                  width: 10.0,
                                  style: BorderStyle.solid),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(child: Text("Camara inactiva"))),
          Text("QRCODE: $qr"),
        ],
      ),
    );
  }

  Widget _crearBotonScan() {
    return Container(
      width: double.infinity,
      height: 100,
      child: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: () {
          setState(() {
            camState = !camState;
          });
        },
        backgroundColor: Colors.black,
      ),
    );
  }

  _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: FractionalOffset(0, 0.2),
        end: FractionalOffset(0, 1.0),
        colors: [
          Color.fromRGBO(255, 255, 255, 1),
          Color.fromRGBO(255, 255, 255, 1)
        ],
      )),
    );

    final cajaRosada = Transform.rotate(
      angle: -pi / 5,
      child: Container(
        height: 360,
        width: 360,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(0, 0, 0, 1),
              Color.fromRGBO(0, 0, 0, 1),
            ])),
      ),
    );

    return Stack(
      children: [
        gradiente,
        Positioned(top: -100, child: cajaRosada),
      ],
    );
  }

  _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage('assets/uptc.png'),
              fit: BoxFit.cover,
              width: 300,
            ),
          ],
        ),
      ),
    );
  }
}
