import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {
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
                  _botonesRedondeados(context),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: _bottomNavigationBar(context));
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

  _bottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(26, 26, 26, 1),
          primaryColor: Color.fromRGBO(255, 204, 41, 1),
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Color.fromRGBO(255, 204, 41, 1)))),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today, size: 30), title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.bubble_chart, size: 30), title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle, size: 30),
              title: Container())
        ],
      ),
    );
  }

  _botonesRedondeados(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          _crearBotonRedondeado(context, Colors.black,
              Icons.format_list_bulleted_outlined, 'Encuesta', 'encuesta'),
          _crearBotonRedondeado(context, Colors.black,
              Icons.qr_code_scanner_sharp, 'QR', 'readQR')
        ]),
        TableRow(children: [
          _crearBotonRedondeado(context, Colors.black, Icons.contacts_rounded,
              'Lector C.C', 'cedula'),
          _crearBotonRedondeado(context, Colors.black,
              Icons.baby_changing_station_rounded, 'Opc 4', 'encuesta')
        ]),
        TableRow(children: [
          _crearBotonRedondeado(context, Colors.red, Icons.border_all_rounded,
              'Opc 5', 'encuesta'),
          _crearBotonRedondeado(
              context, Colors.grey, Icons.nat_sharp, 'Opc 6', 'encuesta')
        ]),
        TableRow(children: [
          _crearBotonRedondeado(context, Colors.tealAccent,
              Icons.border_all_rounded, 'Opc 7', 'encuesta'),
          _crearBotonRedondeado(context, Colors.pinkAccent,
              Icons.border_all_rounded, 'Opc 8', 'encuesta')
        ]),
      ],
    );
  }

  _crearBotonRedondeado(BuildContext context, Color color, IconData icono,
      String texto, String ruta) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
      child: InkWell(
        child: Container(
          height: 250,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Color.fromRGBO(26, 26, 26, 0.7),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 5,
              ),
              CircleAvatar(
                backgroundColor: color,
                radius: 40,
                child: Icon(icono, color: Colors.white, size: 30),
              ),
              Text(
                texto,
                style: TextStyle(color: color),
              ),
              SizedBox(
                height: 5,
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/$ruta');
        },
      ),
    );
  }
}
