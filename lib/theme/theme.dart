import 'package:flutter/material.dart';

final theme = ThemeData.dark().copyWith(
  accentColor: Color.fromARGB(255, 93, 156, 238),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Color.fromARGB(255, 93, 156, 238),
    unselectedItemColor: Colors.black54
  )
);