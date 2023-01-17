import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  
  int _paginaActual = 0;
  final PageController _pageController = PageController();

  int get paginaActual {
    return this._paginaActual;
  }

  set paginaActual(int valor) {
    this._paginaActual = valor;
    this._pageController.animateToPage(valor, duration: const Duration(milliseconds: 500), curve: Curves.bounceIn);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}