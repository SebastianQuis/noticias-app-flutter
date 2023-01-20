import 'package:flutter/material.dart';
import 'package:noticias_app/preferences/preferences.dart';
import 'package:noticias_app/providers/theme_provider.dart';
import 'package:noticias_app/screens/screens.dart';
import 'package:noticias_app/services/noticias_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) =>  ThemeProvider(esModoOscuro: Preferences.esModoOscuro)),
      ChangeNotifierProvider(create: (_) =>  NoticiasService()),
    ],
    child: const MyApp(),
  ));
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Noticias App',
      initialRoute: 'tabs',
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        'tabs'      : (_) => TabsScreen(),
        'home'      : (_) => const HomeScreen(),
        'categories': (_) => const CategoriesScreen(),
        'settings'  : (_) => SettingsScreen(),
      },
    );
  }
}