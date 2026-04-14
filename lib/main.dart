import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentScreen = 0; // 0: Login, 1: Signup, 2: Home

  void _navigateToLogin() {
    setState(() => _currentScreen = 0);
  }

  void _navigateToSignup() {
    setState(() => _currentScreen = 1);
  }

  void _navigateToHome() {
    setState(() => _currentScreen = 2);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HUIT Stationery',
      theme: ThemeData(
        primaryColor: const Color(0xFF003D82),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: _buildScreen(),
    );
  }

  Widget _buildScreen() {
    switch (_currentScreen) {
      case 0:
        return LoginScreen(
          onSignupTap: _navigateToSignup,
          onLoginSuccess: _navigateToHome,
        );
      case 1:
        return SignupScreen(
          onLoginTap: _navigateToLogin,
          onSignupSuccess: _navigateToHome,
        );
      case 2:
        return HomeScreen(onLogout: _navigateToLogin);
      default:
        return LoginScreen(
          onSignupTap: _navigateToSignup,
          onLoginSuccess: _navigateToHome,
        );
    }
  }
}
