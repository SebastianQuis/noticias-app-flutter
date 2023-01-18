import 'package:flutter/material.dart';

import 'package:noticias_app/models/noticias_models.dart';
import 'package:noticias_app/theme/theme.dart';

class ListaNoticias extends StatefulWidget {  
  final List<Article> encabezados;
  const ListaNoticias( this.encabezados );

  @override
  State<ListaNoticias> createState() => _ListaNoticiasState();
}

// mantiene estado de la app AutomaticKeepAliveClientMixin
class _ListaNoticiasState extends State<ListaNoticias> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.encabezados.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            _TarjetaTop( encabezados: widget.encabezados[index], index: index ),
            _TarjetaTitulo( widget.encabezados[index] ),
            _TarjetaImagen( widget.encabezados[index] ),
            _TarjetaBody( widget.encabezados[index] ),
            _TarjetaBotones( widget.encabezados[index] ),

            SizedBox( height: 5 ),
            Divider(),
          ],
        );
      },
    );
  }
  
  @override
  bool get wantKeepAlive => true; // true para mantener estado
}

class _TarjetaBotones extends StatelessWidget {
  final Article encabezados;

  const _TarjetaBotones(  this.encabezados );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RawMaterialButton(
            onPressed: () {
              print('${encabezados.url}');
              // print('${encabezados.}');
            },
            fillColor: AppTheme.celeste,
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Icon(Icons.web),
                Text(' Web')
              ],
            ),
          ),

          SizedBox( width: 10 ),
          
          RawMaterialButton(
            onPressed: () {}, //TODO: enviar a sitio web
            fillColor: AppTheme.rojo,
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Icon(Icons.more_outlined),
                Text(' algo')
              ],
            ),
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
      padding: EdgeInsets.symmetric( horizontal: 25, vertical: 5 ),
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
      borderRadius: const BorderRadius.all( Radius.circular(50) ),
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
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Text( '${ index + 1 }. ' , style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold)),
          Text( '${ encabezados.source.name }', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}