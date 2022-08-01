import 'package:flutter/material.dart';
import 'package:preferencias_usuario/screens/screens.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        const _Drawerheader(),
        ListTile(
          leading: const Icon(Icons.home_filled),
          title: const Text('Inicio'),
          onTap: () =>
              Navigator.pushReplacementNamed(context, HomeScreen.routerName),
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Ajustes'),
          onTap: () => Navigator.pushReplacementNamed(
              context, SettingsScreen.routerName),
        )
      ]),
    );
  }
}

class _Drawerheader extends StatelessWidget {
  const _Drawerheader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DrawerHeader(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover)),
      child: Offstage(),
    );
  }
}
