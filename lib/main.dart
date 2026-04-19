import 'package:app_dung_cu_hoc_tap/screens/auth/profile_screen.dart';
import 'package:app_dung_cu_hoc_tap/screens/checkout/order_success_screen.dart';
import 'package:app_dung_cu_hoc_tap/screens/home/forbidden_screen.dart';
import 'package:app_dung_cu_hoc_tap/screens/home/home_screen.dart';
import 'package:app_dung_cu_hoc_tap/screens/home/about_screen.dart';
import 'package:app_dung_cu_hoc_tap/screens/home/lien_he.dart';
import 'package:app_dung_cu_hoc_tap/screens/home/not_found_screen.dart';
import 'package:app_dung_cu_hoc_tap/screens/orders/order_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_dung_cu_hoc_tap/screens/cart/cart_screen.dart';
import 'package:app_dung_cu_hoc_tap/screens/checkout/checkout_screen.dart';
import 'package:app_dung_cu_hoc_tap/screens/orders/order_detail_screen.dart';
import 'package:app_dung_cu_hoc_tap/screens/auth/forgot_password_screen.dart';
import 'package:app_dung_cu_hoc_tap/screens/auth/login_screen.dart';
import 'package:app_dung_cu_hoc_tap/screens/auth/register_screen.dart';
import 'package:app_dung_cu_hoc_tap/screens/admin/admin_dashboard_screen.dart';
import 'package:app_dung_cu_hoc_tap/screens/admin/manage_products.dart';
import 'package:app_dung_cu_hoc_tap/screens/admin/order_manage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HUIT Stationery',
      theme: ThemeData(
        primaryColor: const Color(0xFF0B3C8C),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0B3C8C)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/product_list': (context) => const NotFoundScreen(),
        '/product_detail': (context) => const NotFoundScreen(),
        '/cart': (context) => const CartScreen(),
        '/checkout': (context) => const CheckoutScreen(),
        '/forgot_password': (context) => const ForgotPasswordScreen(),
        '/login': (context) => LoginScreen(
          onSignupTap: () {
            Navigator.pushReplacementNamed(context, '/register');
          },
          onLoginSuccess: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        '/register': (context) => SignupScreen(
          onSignupSuccess: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
          onLoginTap: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
        '/profile': (context) => const ProfileScreen(),
        '/orders': (context) => const OrderHistoryScreen(),
        '/about': (context) => const AboutScreen(),
        '/contact': (context) => const ContactScreen(),
        '/admin': (context) => const AdminDashboardScreen(),
        '/order_success': (context) => const OrderSuccessScreen(),
        '/order_detail': (context) => const OrderDetailScreen(),
        '/manage_products': (context) => const ProductManagementScreen(),
        '/order_manage': (context) => const OrderManagementScreen(),
        '/not_found': (context) => const NotFoundScreen(),
        '/forbidden': (context) => const ForbiddenScreen(),
      },
    );
  }
}
