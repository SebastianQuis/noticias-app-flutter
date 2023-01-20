import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  
  int _paginaActual = 0;
  final PageController _pageController = PageController();

  int get paginaActual {
    return _paginaActual;
  }

  set paginaActual(int valor) {
    _paginaActual = valor;
    _pageController.
      animateToPage(valor, duration: const Duration(milliseconds: 500), curve: Curves.ease);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}