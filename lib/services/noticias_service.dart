import 'package:flutter/material.dart';
import 'package:noticias_app/models/noticias_models.dart';
import 'package:http/http.dart' as http;
import 'dart:core';


class NoticiasService with ChangeNotifier {

  final _baseUrl = 'newsapi.org';
  final _apiKey  = '5ce5d251fb4147dd93f1a3e2053f484d';
  final _pais    = 'ar';
  List<Article> encabezados = [];

  NoticiasService(){
    obtenerEncabezados();
  }

  obtenerEncabezados() async {
    var uri = Uri.https('newsapi.org', '/v2/top-headlines',
        {'country': _pais, 'apiKey': _apiKey});
    final resp = await http.get(uri); 
    final noticiasResponse = noticiasResponseFromJson( resp.body );
    this.encabezados.addAll( noticiasResponse.articles );
    notifyListeners();
  }

}