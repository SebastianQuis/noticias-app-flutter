import 'package:flutter/material.dart';

import 'package:noticias_app/screens/screens.dart';
import 'package:noticias_app/theme/theme.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Noticias App',
      initialRoute: 'tabs',
      theme: theme,
      routes: {
        'tabs': (context) => TabsScreen()
      },
    );
  }
}