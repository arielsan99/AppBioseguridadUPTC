import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Encuesta extends StatefulWidget {
  Encuesta({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<Encuesta> {
  bool _pregunta1 = false;
  bool _pregunta2 = false;
  bool _pregunta3 = false;
  bool _pregunta4 = false;
  bool _pregunta5 = false;
  bool _pregunta6 = false;
  bool _pregunta7 = false;
  bool _pregunta8 = false;

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
                SizedBox(height: 70),
                _crearSwitchPregunta1(
                    'Tiene fiebre o la ha tenido los ultimos 14 días?  (Temperatura mayor a 38º)'),
                _crearSwitchPregunta2(
                    'Tiene o ha tenido los ultimos 14 días diarrea u otras molestias digestivas?'),
                _crearSwitchPregunta3(
                    'Tiene o ha tenido sensación de mucho cansancio o malestar en los ultimos 14 días?'),
                _crearSwitchPregunta4(
                    'Ha notado una pérdida del sentido del gusto o del olfato en los ultimos 14 dias?'),
                _crearSwitchPregunta5(
                    'Ha estado conviviendo con alguna persona sospechososa o confirmada de coronavirus por Covid 19?'),
                _crearSwitchPregunta6(
                    'Ha presentado la enfermedad de Covid 19?'),
                _crearSwitchPregunta7(
                    'En casi de haber presentado la enfermedad ¿Sigue usted en cuarentena?'),
                _crearSwitchPregunta8(
                    'Manifiesta signos o síntomas de enfermedad respiratoria diferentes a os asociados al Covid 19?'),
                Divider(),
                _crearRespuestasPreguntas(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _crearSwitchPregunta1(String pregunta) {
    return Container(
      margin: EdgeInsets.all(25),
      child: SwitchListTile(
        title: Text(
          pregunta,
          style: TextStyle(fontSize: 18),
        ),
        value: _pregunta1,
        onChanged: (bool value) {
          setState(() {
            _pregunta1 = value;
          });
        },
        secondary: const Icon(Icons.lightbulb_outline),
      ),
    );
  }

  Widget _crearSwitchPregunta2(String pregunta) {
    return Container(
      margin: EdgeInsets.all(25),
      child: SwitchListTile(
        title: Text(
          pregunta,
          style: TextStyle(fontSize: 18),
        ),
        value: _pregunta2,
        onChanged: (bool value) {
          setState(() {
            _pregunta2 = value;
          });
        },
        secondary: const Icon(Icons.lightbulb_outline),
      ),
    );
  }

  Widget _crearSwitchPregunta3(String pregunta) {
    return Container(
      margin: EdgeInsets.all(25),
      child: SwitchListTile(
        title: Text(
          pregunta,
          style: TextStyle(fontSize: 18),
        ),
        value: _pregunta3,
        onChanged: (bool value) {
          setState(() {
            _pregunta3 = value;
          });
        },
        secondary: const Icon(Icons.lightbulb_outline),
      ),
    );
  }

  Widget _crearSwitchPregunta4(String pregunta) {
    return Container(
      margin: EdgeInsets.all(25),
      child: SwitchListTile(
        title: Text(
          pregunta,
          style: TextStyle(fontSize: 18),
        ),
        value: _pregunta4,
        onChanged: (bool value) {
          setState(() {
            _pregunta4 = value;
          });
        },
        secondary: const Icon(Icons.lightbulb_outline),
      ),
    );
  }

  Widget _crearSwitchPregunta6(String pregunta) {
    return Container(
      margin: EdgeInsets.all(25),
      child: SwitchListTile(
        title: Text(
          pregunta,
          style: TextStyle(fontSize: 18),
        ),
        value: _pregunta6,
        onChanged: (bool value) {
          setState(() {
            _pregunta6 = value;
          });
        },
        secondary: const Icon(Icons.lightbulb_outline),
      ),
    );
  }

  Widget _crearSwitchPregunta7(String pregunta) {
    return Container(
      margin: EdgeInsets.all(25),
      child: SwitchListTile(
        title: Text(
          pregunta,
          style: TextStyle(fontSize: 18),
        ),
        value: _pregunta7,
        onChanged: (bool value) {
          setState(() {
            _pregunta7 = value;
          });
        },
        secondary: const Icon(Icons.lightbulb_outline),
      ),
    );
  }

  Widget _crearSwitchPregunta8(String pregunta) {
    return Container(
      margin: EdgeInsets.all(25),
      child: SwitchListTile(
        title: Text(
          pregunta,
          style: TextStyle(fontSize: 18),
        ),
        value: _pregunta8,
        onChanged: (bool value) {
          setState(() {
            _pregunta8 = value;
          });
        },
        secondary: const Icon(Icons.lightbulb_outline),
      ),
    );
  }

  Widget _crearSwitchPregunta5(String pregunta) {
    return Container(
      margin: EdgeInsets.all(25),
      child: SwitchListTile(
        title: Text(
          pregunta,
          style: TextStyle(fontSize: 18),
        ),
        value: _pregunta5,
        onChanged: (bool value) {
          setState(() {
            _pregunta5 = value;
          });
        },
        secondary: const Icon(Icons.lightbulb_outline),
      ),
    );
  }

  Widget _crearRespuestasPreguntas() {
    return ListTile(
      title: Text('Pregunta 1 :$_pregunta1'),
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
