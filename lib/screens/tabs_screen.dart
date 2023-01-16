import 'package:flutter/material.dart';

import 'package:noticias_app/screens/screens.dart';
import 'package:noticias_app/providers/navigation_provider.dart';
 
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
    final currentIndex = navigationProvider.paginaActual;
    
    return BottomNavigationBar(
      onTap: (value) => navigationProvider.paginaActual = value,
      currentIndex: currentIndex,
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

    switch (navigationProvider.paginaActual) {
      case 0:
        return Tab1Screen();
      case 1:
        return Tab2Screen();
      default:
        return Tab1Screen();
    }
  }
}