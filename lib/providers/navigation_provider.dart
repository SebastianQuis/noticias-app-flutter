import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  
  int _paginaActual = 0;

  int get paginaActual {
    return this._paginaActual;
  }

  set paginaActual(int i) {
    this._paginaActual = i;
    notifyListeners();
  }
}