import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/info_page.dart';
import 'pages/reports_page.dart';
import 'pages/services_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final hasSeenSplash = prefs.getBool('seenSplash') ?? false;

  runApp(RadhiantApp(startAtHome: hasSeenSplash));
}

class RadhiantApp extends StatelessWidget {
  final bool startAtHome;

  const RadhiantApp({Key? key, required this.startAtHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radhiant',
      theme: AppTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: startAtHome ? '/home' : '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/profile': (context) => const ProfilePage(),
        '/info': (context) => const InfoPage(),
        '/reports': (context) => const ReportsPage(),
        '/services': (context) => const ServicesPage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));
    await prefs.setBool('seenSplash', true);
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF50C878),
      body: Center(
        child: Image.asset(
          'assets/splash.png',
          width: 200,
        ),
      ),
    );
  }
}
