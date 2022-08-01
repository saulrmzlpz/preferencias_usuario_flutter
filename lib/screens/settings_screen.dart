import 'package:flutter/material.dart';
import 'package:preferencias_usuario/providers/theme_provider.dart';
import 'package:preferencias_usuario/shared_preferences/preferences.dart';
import 'package:preferencias_usuario/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routerName = 'Settings';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SwitchListTile.adaptive(
              title: const Text('Modo obscuro'),
              value: Preferences.isDarkMode,
              onChanged: (value) {
                Preferences.isDarkMode = value;

                final themeProvider =
                    Provider.of<ThemeProvider>(context, listen: false);
                value
                    ? themeProvider.setDarkMode()
                    : themeProvider.setLightMode();
                setState(() {});
              }),
          RadioListTile<int>(
              title: const Text('Masculino'),
              value: 1,
              groupValue: Preferences.gender,
              onChanged: (value) =>
                  setState(() => Preferences.gender = value ?? 1)),
          RadioListTile<int>(
              title: const Text('Femenino'),
              value: 2,
              groupValue: Preferences.gender,
              onChanged: (value) =>
                  setState(() => Preferences.gender = value ?? 2)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              initialValue: Preferences.name,
              onChanged: (value) => setState(() => Preferences.name = value),
              decoration: const InputDecoration(
                  labelText: 'Nombre', helperText: 'Nombre del usuario'),
            ),
          )
        ]),
      ),
    );
  }
}
