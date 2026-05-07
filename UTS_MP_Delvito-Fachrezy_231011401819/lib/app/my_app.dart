import 'package:flutter/material.dart';
import '../screen/workshop_list_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workshop Kampus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        fontFamily: 'Roboto',
        primaryColor: const Color(0xFF6C5CE7),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2D3436),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const WorkshopListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}