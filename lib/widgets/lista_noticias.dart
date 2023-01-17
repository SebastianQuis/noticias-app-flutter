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
            _TarjetaBody( encabezados[index] ),
            _TarjetaBotones(),

            SizedBox( height: 5 ),
            Divider(),
          ],
        );
      },
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {},
            fillColor: theme.accentColor,
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.star_outline),
          ),

          SizedBox( width: 10 ),
          
          RawMaterialButton(
            onPressed: () {}, //TODO: enviar a sitio web
            fillColor: Colors.green[200],
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.more_outlined),
          ),
        ],
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Article encabezados;

  const _TarjetaBody( this.encabezados );


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 25 ),
      child: encabezados.description != null
        ? Text( encabezados.description!, style: TextStyle(overflow: TextOverflow.ellipsis), maxLines: 3, )
        : Text(''),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Article encabezados;

  const _TarjetaImagen( this.encabezados );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all( Radius.circular(40) ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: (encabezados.urlToImage != null) 
          ? FadeInImage(
              placeholder: AssetImage('assets/giphy.gif'), 
              image: NetworkImage( '${encabezados.urlToImage}' ))
          : FadeInImage(
              placeholder: AssetImage('assets/giphy.gif'), 
              image: AssetImage('assets/no-image.png'))
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Article encabezados;

  const _TarjetaTitulo( this.encabezados );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Text('${encabezados.title}', style: TextStyle( fontSize: 16, overflow: TextOverflow.ellipsis), maxLines: 3,),
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
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          Text( '${ index + 1 }. ' , style: TextStyle( fontSize: 20, color: theme.accentColor, fontWeight: FontWeight.w700)),
          Text( '${ encabezados.source.name }', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
        ],
      ),
    );
  }
}