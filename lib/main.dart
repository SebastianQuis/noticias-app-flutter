import 'package:flutter/material.dart';

import 'package:noticias_app/screens/screens.dart';
import 'package:noticias_app/services/noticias_service.dart';
import 'package:noticias_app/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp( AppEstado());

  // APIKEY NEWS: 5ce5d251fb4147dd93f1a3e2053f484d
class AppEstado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>  NoticiasService()),
      ],
      child: MyApp()
    );
  }
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Noticias App',
      initialRoute: 'tabs',
      theme: AppTheme.lightTheme,
      routes: {
        'tabs': (context) => TabsScreen(),
        'tab1': (context) => Tab1Screen(),
        'tab2': (context) => Tab2Screen(),
      },
    );
  }
}