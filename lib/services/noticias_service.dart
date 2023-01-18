import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noticias_app/models/categorias_models.dart';
import 'package:noticias_app/models/noticias_models.dart';
import 'package:http/http.dart' as http;
import 'dart:core';


class NoticiasService with ChangeNotifier {

  final _baseUrl = 'newsapi.org';
  final _apiKey  = '5ce5d251fb4147dd93f1a3e2053f484d';
  final _pais    = 'us';
  List<Article> encabezados = [];
  
  List<Categoria> categorias = [
    Categoria( FontAwesomeIcons.building, 'business'),
    Categoria( FontAwesomeIcons.tv, 'entertainment'),
    Categoria( FontAwesomeIcons.addressCard, 'general'),
    Categoria( FontAwesomeIcons.headSideVirus, 'health'),
    Categoria( FontAwesomeIcons.vials, 'science'),
    Categoria( FontAwesomeIcons.futbol, 'sports'),
    Categoria( FontAwesomeIcons.memory, 'technology'),
  ];

  // business entertainment general health science sports technology

  NoticiasService(){
    obtenerEncabezados();
  }

  obtenerEncabezados() async {
    var uri = Uri.https(_baseUrl, '/v2/top-headlines',
        {'country': _pais, 'apiKey': _apiKey});
    final resp = await http.get(uri); 
    final noticiasResponse = noticiasResponseFromJson( resp.body );
    encabezados.addAll( noticiasResponse.articles );
    notifyListeners();
  }

}