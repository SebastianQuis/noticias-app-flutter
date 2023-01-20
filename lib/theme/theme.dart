import 'package:flutter/material.dart';

class AppTheme {
  
  static const Color primary = Color.fromARGB(255, 29, 53, 87); 
  static const Color celesteSemiOscuro = Color.fromARGB(255, 69, 123, 157); 
  static const Color celeste = Color.fromARGB(255, 168, 218, 220); 
  static const Color blanco = Color.fromARGB(255, 241, 250, 238); 
  static const Color rojo = Color.fromARGB(255, 230, 57, 70); 

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0
    ),
    
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: primary)
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 5, 
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primary,
      selectedItemColor: blanco,
      unselectedItemColor: blanco.withOpacity(0.3)
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primary,
        shape: const StadiumBorder(),
        elevation: 0
      ),
    ),
    
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle( color: Colors.black ),
      prefixIconColor: primary,
      border: InputBorder.none,
      // focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppTheme.primary))
    ),

    
  );
  
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0
    ),
    
    scaffoldBackgroundColor: Colors.black54
  );

  
  
}

// final theme = ThemeData.light().copyWith(
//   accentColor: Color.fromARGB(255, 93, 156, 238),
//   primaryColor: Color.fromARGB(255, 69, 123, 157), // blanco
//   // rojo
//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     backgroundColor: Color.fromARGB(255, 29, 53, 87),
//     selectedItemColor: Color.fromARGB(255, 241, 250, 238),
//     unselectedItemColor: Colors.black87
//   ),
//   // progressIndicatorTheme: ProgressIndicatorThemeData(color: Color.fromARGB(255, 93, 156, 238),)
// );