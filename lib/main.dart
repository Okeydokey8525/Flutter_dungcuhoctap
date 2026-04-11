import 'package:flutter/material.dart';
import 'services/database_helper.dart';

void main() async {
  // 1. Khởi tạo binding cho Flutter
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Kiểm tra Database (Logic từ HEAD của bạn)
  final db = DatabaseHelper.instance;

  // Thử đăng ký tài khoản admin
  await db.registerUser({
    'username': 'admin',
    'password': '123',
    'email': 'admin@gmail.com',
    'role': 'admin',
  });

  // Thử đăng nhập và in kết quả ra Console
  final user = await db.loginUser('admin', '123');
  debugPrint('Dữ liệu người dùng: $user');

  // 3. Chạy ứng dụng
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Dụng Cụ Học Tập',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Trang Chủ Test Database'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.storage,
              size: 50,
              color: Colors.blue,
            ), // Đổi database -> storage
            SizedBox(height: 20),
            Text(
              'Database đã khởi tạo!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Kiểm tra Debug Console để xem thông tin User.'),
          ],
        ),
      ),
    );
  }
}
