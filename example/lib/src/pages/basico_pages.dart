import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final estiloSubitulo = TextStyle(fontSize: 18, color: Colors.grey);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _crearImage(),
            _crearTitulo(),
            _crearAcciones(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
          ],
        ),
      ),
    );
  }

  _crearImage() {
    return Container(
      width: double.infinity,
      child: Image(
        image: NetworkImage(
          'https://d500.epimg.net/cincodias/imagenes/2019/12/24/lifestyle/1577177486_105469_1577177593_sumario_normal.jpg',
        ),
        height: 250,
        fit: BoxFit.cover,
      ),
    );
  }

  _crearTitulo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Paisaje', style: estiloTitulo),
                  SizedBox(height: 7),
                  Text('Imagen en 4k paisaje', style: estiloSubitulo),
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red,
              size: 30,
            ),
            Text(
              '41',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _accion(Icons.call, 'Llamar'),
        _accion(Icons.near_me, 'Ruta'),
        _accion(Icons.share, 'Compartir'),
      ],
    );
  }

  _accion(IconData icon, String texto) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blue,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          texto,
          style: TextStyle(fontSize: 15, color: Colors.blue),
        )
      ],
    );
  }

  _crearTexto() {
    return SafeArea(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Text(
            'Enim exercitation exercitation culpa nulla in eiusmod incididunt irure excepteur elit proident excepteur nulla. Dolore ea cillum minim dolor dolor minim occaecat officia do deserunt dolor anim dolore. Ea consequat dolore aliqua consectetur non ipsum ipsum dolor aliquip. Irure aliqua minim fugiat esse in ullamco. Esse incididunt dolor eu aliqua reprehenderit commodo et Lorem deserunt. Incididunt cupidatat consectetur incididunt consequat deserunt et aliquip laborum.',
            textAlign: TextAlign.justify,
          )),
    );
  }
}
