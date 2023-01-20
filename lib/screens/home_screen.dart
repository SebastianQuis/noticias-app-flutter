import 'package:flutter/material.dart';
import 'package:noticias_app/services/noticias_service.dart';
import 'package:noticias_app/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';
 
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final noticiasService = Provider.of<NoticiasService>(context);
    
    return noticiasService.encabezados.isNotEmpty
      ? ListaNoticias( noticiasService.encabezados )
      : const Center( child: CircularProgressIndicator.adaptive() );
  }
}