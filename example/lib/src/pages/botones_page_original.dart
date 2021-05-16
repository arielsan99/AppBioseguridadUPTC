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
                  _botonesRedondeados(),
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
        colors: [Color.fromRGBO(52, 54, 101, 1), Color.fromRGBO(35, 37, 57, 1)],
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
              Color.fromRGBO(236, 98, 188, 1),
              Color.fromRGBO(241, 142, 172, 1),
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
            Text(
              'App diseños',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'App de diseños en flutter con gradientes',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _bottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(55, 57, 84, 1),
          primaryColor: Colors.pinkAccent,
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1)))),
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

  _botonesRedondeados() {
    return Table(
      children: [
        TableRow(children: [
          _crearBotonRedondeado(
              Colors.redAccent, Icons.accessibility_new_sharp, 'General'),
          _crearBotonRedondeado(Colors.blue, Icons.ac_unit_outlined, 'Opc 2')
        ]),
        TableRow(children: [
          _crearBotonRedondeado(
              Colors.greenAccent, Icons.border_all_rounded, 'Opc 3'),
          _crearBotonRedondeado(
              Colors.orange, Icons.baby_changing_station_rounded, 'Opc 4')
        ]),
        TableRow(children: [
          _crearBotonRedondeado(Colors.red, Icons.border_all_rounded, 'Opc 5'),
          _crearBotonRedondeado(Colors.grey, Icons.nat_sharp, 'Opc 6')
        ]),
        TableRow(children: [
          _crearBotonRedondeado(
              Colors.tealAccent, Icons.border_all_rounded, 'Opc 7'),
          _crearBotonRedondeado(
              Colors.pinkAccent, Icons.border_all_rounded, 'Opc 8')
        ]),
      ],
    );
  }

  _crearBotonRedondeado(Color color, IconData icono, String texto) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
      child: Container(
        height: 250,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.7),
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
    );
  }
}
