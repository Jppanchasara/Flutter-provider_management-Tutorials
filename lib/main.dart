

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_management/Provider/auth_provider.dart';
import 'package:provider_management/Provider/count_Provider.dart';
import 'package:provider_management/Provider/example_one_provider.dart';
import 'package:provider_management/Provider/favourite_provider.dart';
import 'package:provider_management/Provider/theme_changer_provider.dart';
import 'package:provider_management/Screen/LikeApp/favourite_screen.dart';
import 'package:provider_management/Screen/count_Example.dart';
import 'package:provider_management/Screen/dark_theme.dart';
import 'package:provider_management/Screen/example_one.dart';
import 'package:provider_management/Screen/login.dart';
import 'package:provider_management/Screen/value_notify_listener.dart';
import 'package:provider_management/main2.dart';
import 'package:provider_management/whyProvider.dart';

import 'homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>CountProvider()),
        ChangeNotifierProvider(create: (_)=>ExampleOneProvider()),
        ChangeNotifierProvider(create: (_)=>FavouriteProvider()),
        ChangeNotifierProvider(create: (_)=>ThemeChanger() ,),
        ChangeNotifierProvider(create: (_)=>AutyProvider())


      ],
      child: Builder(builder: (BuildContext context){
        final themechanger =Provider.of<ThemeChanger>(context);
        return MaterialApp(
        title: 'Flutter Demo',
        themeMode: themechanger.themeMode,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.yellow,
          primaryColor:Colors.yellow,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.teal
          ),
          iconTheme: const IconThemeData(
            color: Colors.pink
          )
        ),
        home: MainScreen(),
        );

      })
      );
    
  }
}
