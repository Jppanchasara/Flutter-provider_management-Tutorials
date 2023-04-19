import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:provider_management/Provider/theme_changer_provider.dart';

class DarkThemeChanger extends StatefulWidget {
  const DarkThemeChanger({super.key});

  @override
  State<DarkThemeChanger> createState() => _DarkThemeChangerState();
}

class _DarkThemeChangerState extends State<DarkThemeChanger> {
  @override
  Widget build(BuildContext context) {
  final themechanger =Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Changer"),
        elevation: 15,
        centerTitle: true,
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            RadioListTile<ThemeMode>(
              title: Text("Light Mode"),
              value: ThemeMode.light, 
              groupValue: themechanger.themeMode, 
              onChanged: themechanger.setTheme,
            ),
            RadioListTile<ThemeMode>(
              title: Text("Dark Mode"),
              value: ThemeMode.dark, 
              groupValue: themechanger.themeMode, 
              onChanged: themechanger.setTheme,
            ),
            RadioListTile<ThemeMode>(
              title: Text("System Mode"),
              value: ThemeMode.system, 
              groupValue: themechanger.themeMode, 
              onChanged: themechanger.setTheme,
            ),
            SizedBox(height: 25,),
            Icon(Icons.favorite,size: 100,)
          ],
        ),
      ),
    );
  }
}