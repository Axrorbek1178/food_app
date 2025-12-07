import 'package:flutter/material.dart';
import 'package:ovqatlar_menyusi/screens/products_screen.dart';
import 'package:ovqatlar_menyusi/screens/tabs_screen.dart';
import 'package:ovqatlar_menyusi/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _buildMenuItem(
    String title,
    IconData icon,
    Function() handle,
    Widget? trailing,
  ) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      onTap: handle,
      trailing: trailing,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text(
              'Menu',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            automaticallyImplyLeading: false,
          ),
          _buildMenuItem("Bosh Sahifa", Icons.home, () {
            Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
          }, null),
          const Divider(height: 0),
          _buildMenuItem("Mahsulotlar", Icons.category, () {
            Navigator.of(
              context,
            ).pushReplacementNamed(ProductsScreen.routeName);
          }, null),
          const Divider(height: 0),
          _buildMenuItem(
            "Dark Mode",

            themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
            () {},
            Switch(
              activeTrackColor: ThemeData.dark().colorScheme.secondary,
              inactiveThumbColor: ThemeData.light().primaryColor,
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                // Switch bosilganda:
                themeProvider.toggleTheme(value);
              },
              activeThumbColor: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
