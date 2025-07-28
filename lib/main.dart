import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';
import 'pages/services_page.dart';
import 'pages/profile_page.dart';
import 'pages/reports_page.dart';
import 'pages/info_page.dart';

void main() {
  runApp(RadhiantApp());
}

class RadhiantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radhiant Patient App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
        '/services': (context) => ServicesPage(),
        '/profile': (context) => ProfilePage(),
        '/reports': (context) => ReportsPage(),
        '/info': (context) => InfoPage(),
      },
    );
  }
}

