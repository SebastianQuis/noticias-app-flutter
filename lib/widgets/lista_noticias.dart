import 'package:flutter/material.dart';

import 'package:noticias_app/models/models.dart';
import 'package:noticias_app/services/noticias_service.dart';
import 'package:noticias_app/theme/theme.dart';
import 'package:provider/provider.dart';

class ListaNoticias extends StatefulWidget {  
  final List<Article> encabezados;
  const ListaNoticias( this.encabezados );

  @override
  State<ListaNoticias> createState() => _ListaNoticiasState();
}

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
  bool get wantKeepAlive => true;
}

class _TarjetaBotones extends StatelessWidget {
  final Article encabezados;

  const _TarjetaBotones(  this.encabezados );

  @override
  Widget build(BuildContext context) {
    final noticiaService = Provider.of<NoticiasService>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 250,
            height: 38,
            child: ( encabezados.publishedAt.month < 10) 
              ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Fecha: ${encabezados.publishedAt.day}/0${encabezados.publishedAt.month}/${encabezados.publishedAt.year}',
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 0.5, 
                    ),
                  ),
                ],
              )
              : Center(child: Text('${encabezados.publishedAt.day} - ${encabezados.publishedAt.month} - ${encabezados.publishedAt.year}', maxLines: 1,)),
          ),

          SizedBox( width: 10 ),
          
          RawMaterialButton(
            onPressed: () {
              print('${encabezados.url}');
              noticiaService.enviarSitioWeb(encabezados.url);
            },
            fillColor: AppTheme.rojo,
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Icon(Icons.web),
                Text(' Web')
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
      padding: const EdgeInsets.symmetric( horizontal: 25, vertical: 5 ),
      child: encabezados.description != null
        ? Text( encabezados.description!, style: TextStyle(overflow: TextOverflow.ellipsis, letterSpacing: 0.5), maxLines: 3, )
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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: (encabezados.urlToImage != null) 
          ? FadeInImage(
              placeholder: const AssetImage('assets/giphy.gif'), 
              image: NetworkImage( '${encabezados.urlToImage}' ))
          : const FadeInImage(
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
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Text( encabezados.title, style: const TextStyle( fontSize: 16, overflow: TextOverflow.ellipsis), maxLines: 3,),
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
          Text( encabezados.source.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}