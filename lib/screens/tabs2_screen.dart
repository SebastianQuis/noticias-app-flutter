import 'package:flutter/material.dart';
import 'package:noticias_app/models/categorias_models.dart';
import 'package:noticias_app/services/noticias_service.dart';
import 'package:noticias_app/theme/theme.dart';
import 'package:provider/provider.dart';
 
class Tab2Screen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(child: _ListaCategorias()),
          ],
        )
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final categorias = Provider.of<NoticiasService>(context).categorias;

    return ListView.builder(
      physics: BouncingScrollPhysics(), // ios android
      itemCount: categorias.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        final nombre = categorias[index].name;
        return Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              _CategoriaBoton( categorias[index] ),
              SizedBox(height: 5),
              Text('${nombre[0].toUpperCase()}${nombre.substring(1)}' )
            ],
          ),
        );
      },
    );
  }
}

class _CategoriaBoton extends StatelessWidget {
  final Categoria categoria;

  const _CategoriaBoton( this.categoria ); 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('${categoria.name}');
      },
      child: Container(
        width: 80,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppTheme.celesteSemiOscuro.withOpacity(0.5),
        ),
        child: Icon( 
          categoria.icon,
          color: Colors.grey[850],
        )
      ),
    );
  }
}