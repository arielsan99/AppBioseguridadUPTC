import 'package:qr_mobile_vision_example/src/pages/botones_page.dart';
import 'package:qr_mobile_vision_example/src/pages/cedula.dart';
import 'package:qr_mobile_vision_example/src/pages/encuesta.dart';
import 'package:qr_mobile_vision_example/src/pages/read_qr.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => BotonesPage(),
    '/encuesta': (BuildContext context) => Encuesta(),
    '/readQR': (BuildContext context) => ReadQR(),
    '/cedula': (BuildContext context) => Cedula(),
  };
}
