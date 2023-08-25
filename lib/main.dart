import 'package:flutter/material.dart';
import 'package:platina/controller/providers/articles.dart';
import 'package:platina/controller/providers/articles.dart';
import 'package:platina/controller/providers/currencies.dart';
import 'package:platina/controller/providers/currencies.dart';
import 'package:platina/controller/providers/menus.dart';
import 'package:platina/controller/providers/menus.dart';
import 'package:platina/controller/providers/posts.dart';
import 'package:platina/controller/providers/weathers.dart';
import 'package:platina/controller/providers/weathers.dart';
import 'package:platina/view/screens/home.dart';
import 'package:platina/view/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Posts>(
          create: (ctx) => Posts(),
        ),
        ChangeNotifierProvider<Articles>(
          create: (ctx) => Articles(),
        ),
        ChangeNotifierProvider<Currencies>(
          create: (ctx) => Currencies(),
        ),
        ChangeNotifierProvider<Weathers>(
          create: (ctx) => Weathers(),
        ),
        ChangeNotifierProvider<Menus>(
          create: (ctx) => Menus(),
        ),
      ],
      // ignore: prefer_const_constructors
      child: MaterialApp(
        title: 'Platina',
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
