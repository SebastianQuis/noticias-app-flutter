import 'package:flutter/material.dart';
import 'package:noticias_app/services/noticias_service.dart';
import 'package:noticias_app/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';
 
class HomeScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final noticiasService = Provider.of<NoticiasService>(context);
    
    return noticiasService.encabezados.length > 0
      ? ListaNoticias( noticiasService.encabezados )
      : Center( child: CircularProgressIndicator.adaptive() );
  }
}