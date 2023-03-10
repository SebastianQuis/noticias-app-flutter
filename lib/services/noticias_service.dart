import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noticias_app/models/categorias_models.dart';
import 'package:noticias_app/models/noticias_models.dart';
import 'package:http/http.dart' as http;
import 'dart:core';

import 'package:url_launcher/url_launcher.dart';


class NoticiasService with ChangeNotifier {

  final _baseUrl = 'newsapi.org';
  final _apiKey  = '5ce5d251fb4147dd93f1a3e2053f484d';
  final _pais    = 'us';

  List<Article> encabezados = [];
  String _categoriaSeleccionada = 'business';

  List<Categoria> categorias = [
    Categoria( FontAwesomeIcons.briefcase, 'business'),
    Categoria( FontAwesomeIcons.tv, 'entertainment'),
    Categoria( FontAwesomeIcons.addressCard, 'general'),
    Categoria( FontAwesomeIcons.headSideVirus, 'health'),
    Categoria( FontAwesomeIcons.vials, 'science'),
    Categoria( FontAwesomeIcons.futbol, 'sports'),
    Categoria( FontAwesomeIcons.laptopCode, 'technology'),
  ];

  Map<String, List<Article>> mapaArticulos = {};
  
  NoticiasService(){
    obtenerEncabezados();
    categorias.forEach( (item) { 
      mapaArticulos[item.name] = [];
    });
    obtenerArticulosPorCategoria(categoriaSeleccionada);
  }

  String get categoriaSeleccionada => _categoriaSeleccionada;

  set categoriaSeleccionada( String valor ) {
    _categoriaSeleccionada = valor;
    obtenerArticulosPorCategoria(valor); 
    notifyListeners(); 
  }

  List<Article> get obtenerListaEncabezados => mapaArticulos[ categoriaSeleccionada ]!;

  obtenerEncabezados() async {
    var uri = Uri.https(_baseUrl, '/v2/top-headlines',
        {'country': _pais, 'apiKey': _apiKey});
    final resp = await http.get(uri); 
    final noticiasResponse = noticiasResponseFromJson( resp.body );
    encabezados.addAll( noticiasResponse.articles );
    notifyListeners();
  }
  
  obtenerArticulosPorCategoria( String categoria ) async {
    if ( mapaArticulos[categoria]!.length > 0 ) {
      return mapaArticulos[categoria];
    }
    
    final uri = Uri.https(_baseUrl, '/v2/top-headlines',
        {'country': _pais, 'apiKey': _apiKey, 'category': categoria });
    final resp = await http.get(uri);

    final categoriaResponse = noticiasResponseFromJson( resp.body );
    mapaArticulos[categoria]!.addAll( categoriaResponse.articles );
    notifyListeners();
  }

  enviarSitioWeb( String sitio ) async {
    final uri = Uri.parse(sitio);
    if ( await canLaunchUrl(uri) ) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}