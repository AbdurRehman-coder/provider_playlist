import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_playlist/provider/count_provider.dart';
import 'package:provider_playlist/provider/example_one_provider.dart';
import 'package:provider_playlist/provider/favourite_provider.dart';
import 'package:provider_playlist/provider/theme_changer_provider.dart';
import 'package:provider_playlist/screens/example_one_screen.dart';
import 'package:provider_playlist/screens/favourite/favourite_item_screen.dart';
import 'package:provider_playlist/screens/home_page.dart';
import 'package:provider_playlist/screens/stateless_valueNotifier.dart';
import 'package:provider_playlist/screens/theme_changer_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (context) => FavouriteProvider()),
        ChangeNotifierProvider(create: (context) => ThemeChangerProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          print('builder called');
          var themeProvider = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: themeProvider.themeMode,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.light,
              appBarTheme: AppBarTheme(
                color: Colors.orangeAccent
              )
            ),
            darkTheme: ThemeData(
              primaryColor: Colors.orange,
              primarySwatch: Colors.amber,
              brightness: Brightness.dark,
              appBarTheme: AppBarTheme(
                color: Colors.indigo
              ),
            ),
            home: ValueNotifierWidget(),
          );
        },

      ),
    );
  }
}