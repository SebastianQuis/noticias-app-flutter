import 'package:flutter/material.dart';
import 'package:noticias_app/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {

  ThemeData themeData;
  
  ThemeProvider({required bool esModoOscuro}) : themeData = esModoOscuro 
      ? AppTheme.darkTheme
      : AppTheme.lightTheme;

  setLightMode() {
    themeData = AppTheme.lightTheme;
    notifyListeners();
  }
  
  setDarkMode() {
    themeData = AppTheme.darkTheme;
    notifyListeners();
  }
}