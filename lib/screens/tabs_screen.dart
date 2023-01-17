import 'package:flutter/material.dart';

import 'package:noticias_app/providers/navigation_provider.dart';
import 'package:noticias_app/services/noticias_service.dart';
 
import 'package:provider/provider.dart';

class TabsScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: Scaffold(
        // backgroundColor: Colors.white,
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    // final noticiasService = Provider.of<NoticiasService>(context);
    
    return BottomNavigationBar(
      onTap: (value) => navigationProvider.paginaActual = value,
      currentIndex: navigationProvider.paginaActual,
      items: [
        BottomNavigationBarItem( icon: Icon(Icons.person_outline), label: 'Para ti' ),
        BottomNavigationBarItem( icon: Icon(Icons.public), label: 'Encabezados'),
      ]
    );
  }
}

class _Paginas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return PageView(
      controller: navigationProvider.pageController,
      children: [
        Container(color: Colors.green,),
        Container(color: Colors.blue,),
      ],
    );
  }
}