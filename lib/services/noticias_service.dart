import 'package:flutter/material.dart';
import 'package:noticias_app/models/noticias_models.dart';

class NoticiasService with ChangeNotifier {

  List<Article> encabezados = [];

  NoticiasService(){
    obtenerEncabezados();
  }

  obtenerEncabezados(){
    print('Obteniendo encabezados');
  }

}