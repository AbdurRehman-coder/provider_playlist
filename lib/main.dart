import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_playlist/provider/count_provider.dart';
import 'package:provider_playlist/provider/example_one_provider.dart';
import 'package:provider_playlist/provider/favourite_provider.dart';
import 'package:provider_playlist/screens/example_one_screen.dart';
import 'package:provider_playlist/screens/favourite/favourite_item_screen.dart';
import 'package:provider_playlist/screens/home_page.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FavouriteItemScreen(),
      ),
    );
  }
}