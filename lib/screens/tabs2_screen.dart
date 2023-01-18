import 'package:flutter/material.dart';
import 'package:noticias_app/models/categorias_models.dart';
import 'package:noticias_app/services/noticias_service.dart';
import 'package:noticias_app/theme/theme.dart';
import 'package:noticias_app/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';
 
class Tab2Screen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final noticiasService = Provider.of<NoticiasService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _ListaCategorias(),
            Expanded(
              child: ListaNoticias( noticiasService.obtenerListaEncabezados )
            )
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
    final noticiasService = Provider.of<NoticiasService>(context);

    return Container(
      width: double.infinity,
      height: 80,
      // color: Colors.red,
      child: ListView.builder(
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
                ( noticiasService.categoriaSeleccionada == categorias[index].name ) 
                  ? Text('${nombre[0].toUpperCase()}${nombre.substring(1)}', style: TextStyle(color: AppTheme.rojo),)
                  : Text('${nombre[0].toUpperCase()}${nombre.substring(1)}')
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoriaBoton extends StatelessWidget {
  final Categoria categoria;

  const _CategoriaBoton( this.categoria ); 

  @override
  Widget build(BuildContext context) {
    final noticiaService = Provider.of<NoticiasService>(context);

    return GestureDetector(
      onTap: () {
        final noticiaService = Provider.of<NoticiasService>(context, listen: false);
        noticiaService.categoriaSeleccionada = categoria.name; // enviando la categoria selecionada
        print(noticiaService.categoriaSeleccionada);
      },
      child: Container(
        width: 80,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppTheme.primary,
        ),
        child: Icon( 
          categoria.icon,
          size: 16,
          color: ( noticiaService.categoriaSeleccionada == this.categoria.name) 
                    ? AppTheme.rojo
                    : AppTheme.blanco
        )
      ),
    );
  }
}