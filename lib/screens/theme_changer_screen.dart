import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_playlist/provider/theme_changer_provider.dart';

class ThemeChangeScreen extends StatefulWidget {
  const ThemeChangeScreen({Key? key}) : super(key: key);

  @override
  State<ThemeChangeScreen> createState() => _ThemeChangeScreenState();
}

class _ThemeChangeScreenState extends State<ThemeChangeScreen> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Netflix'),
      ),
      body: Column(
        children: [
          RadioListTile(
            title: Text('Light Theme'),
              value: ThemeMode.light,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setThemeMode,
          ),
          RadioListTile(
            title: Text('dark Theme'),
            value: ThemeMode.dark,
            groupValue: themeProvider.themeMode,
            onChanged: themeProvider.setThemeMode,
          ),
          RadioListTile(
            title: Text('system Theme'),
            value: ThemeMode.system,
            groupValue: themeProvider.themeMode,
            onChanged: themeProvider.setThemeMode,
          ),
        ],
      ),
    );
  }
}