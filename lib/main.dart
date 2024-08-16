import 'package:flutter/material.dart';

import 'home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.yellow,
        ),
        // badgeTheme: const BadgeThemeData(
        //   shape: BadgeShape.circle,
        //   badgeColor: Colors.yellow,
        //   badgeTextColor: Colors.black,
        // ),
      ),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
