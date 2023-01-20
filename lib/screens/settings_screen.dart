import 'package:flutter/material.dart';
import 'package:noticias_app/preferences/preferences.dart';
import 'package:noticias_app/providers/theme_provider.dart';
import 'package:noticias_app/theme/theme.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _TitleBody('Usuario'),
              const Divider(),
              TextFormField(
                initialValue: Preferences.nombre,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                    hintText: 'Nombre',
                    prefixIcon: Icon(Icons.person_outline_rounded)),
                onChanged: (value) {
                  Preferences.nombre = value;
                  setState(() {});
                },
              ),
              const Divider(),
              const _TitleBody('Tema'),
              const Divider(),
              SwitchListTile.adaptive(
                value: Preferences.esModoOscuro,
                title: const Text('Modo oscuro'),
                onChanged: (value) {
                  Preferences.esModoOscuro = value;
                  final themeProvider = Provider.of<ThemeProvider>(context, listen: false); 
                  value == true
                    ? themeProvider.setDarkMode()
                    : themeProvider.setLightMode();
                  setState(() {});
                },
                secondary: const Icon(
                  Icons.light_mode_outlined,
                  color: AppTheme.primary,
                ),
              ),
              const Divider(),
              const _TitleBody('Genero'),
              const Divider(),
              RadioListTile<int>(
                value: 1,
                groupValue: Preferences.genero,
                title: Text('Masculino'),
                onChanged: (value) {
                  Preferences.genero = value ?? 1;
                  setState(() {});
                },
              ),
              const Divider(),
              RadioListTile<int>(
                value: 2,
                groupValue: Preferences.genero,
                title: Text('Femenino'),
                onChanged: (value) {
                  Preferences.genero = value ?? 2;
                  setState(() {});
                },
              ),
              // Column(
              //   children: [
              //     Text('modo oscurso: ${Preferences.esModoOscuro}'),
              //     Text('nombre: ${Preferences.nombre}'),
              //     Text('genero: ${Preferences.genero}'),
              //   ],
              // )
            ],
          ),
        ),
      )),
    );
  }
}

class _TitleBody extends StatelessWidget {
  final String titulo;
  const _TitleBody(this.titulo);

  @override
  Widget build(BuildContext context) {
    return Text(titulo,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }
}
