import 'package:flutter/material.dart';

import 'package:noticias_app/models/noticias_models.dart';
import 'package:noticias_app/theme/theme.dart';

class ListaNoticias extends StatelessWidget {  
  final List<Article> encabezados;
  const ListaNoticias( this.encabezados );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: encabezados.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            _TarjetaTop( encabezados: encabezados[index], index: index ),
            _TarjetaTitulo( encabezados[index] ),
            _TarjetaImagen( encabezados[index] ),
          ],
        );
      },
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Article encabezados;

  const _TarjetaImagen( this.encabezados );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Hola mundo'),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Article encabezados;

  const _TarjetaTitulo( this.encabezados );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text('${encabezados.title}', style: TextStyle( fontSize: 18, fontWeight: FontWeight.w700),),
    );
  }
}

class _TarjetaTop extends StatelessWidget {
  final Article encabezados;
  final int index;

  const _TarjetaTop({ required this.encabezados, required this.index });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 10 ),
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Text( '${ index + 1 } ' , style: TextStyle( color: theme.accentColor)),
          Text( '${ encabezados.source.name } '),
        ],
      ),
    );
  }
}