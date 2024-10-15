import 'package:flutter/material.dart';
import 'package:rickandmorty/app/getit.dart';
import 'package:rickandmorty/app/router.dart';
import 'package:rickandmorty/app/theme.dart';


void main() {
  setupLocater();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
    );
  }
}