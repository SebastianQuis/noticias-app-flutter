import 'package:flutter/material.dart';
import 'package:noticias_app/providers/navigation_provider.dart';
import 'package:noticias_app/screens/screens.dart';
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
        BottomNavigationBarItem( icon: Icon(Icons.home_outlined), label: 'Home' ),
        BottomNavigationBarItem( icon: Icon(Icons.category_outlined), label: 'Categories'),
        BottomNavigationBarItem( icon: Icon(Icons.person_outline), label: 'Settings'),
      ]
    );
  }
}

class _Paginas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: navigationProvider.pageController,
      children: [
        HomeScreen(),
        CategoriesScreen(),
        SettingsScreen(),
      ],
    );
  }
}