import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/profile_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const primaryColor = Color(0xFF0B3C8C);
  static const bgColor = Color(0xFFF5F9FF);

  final ProfileService _profileService = ProfileService();

  bool _isLoading = true;
  String? _errorMessage;

  String _fullName = '';
  String _email = '';
  String _role = '';
  String _userName = '';

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token == null || token.isEmpty) {
        setState(() {
          _errorMessage = 'Chưa đăng nhập';
          _isLoading = false;
        });
        return;
      }

      final result = await _profileService.getProfile(token);

      setState(() {
        _fullName = result['fullName'] ?? '';
        _email = result['email'] ?? '';
        _role = result['role'] ?? '';
        _userName = result['userName'] ?? '';
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString().replaceFirst('Exception: ', '');
        _isLoading = false;
      });
    }
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('refreshToken');

    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/login');
  }

  String _getInitials(String name) {
    if (name.trim().isEmpty) return 'U';
    final parts = name.trim().split(' ');
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return (parts.first[0] + parts.last[0]).toUpperCase();
  }

  String _getRoleLabel(String role) {
    return role.toLowerCase() == 'admin' ? 'Quản trị viên' : 'Thành viên';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Hồ sơ cá nhân',
          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  _errorMessage!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withValues(alpha: 0.2),
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            _getInitials(_fullName),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _fullName.isEmpty ? 'Chưa có tên' : _fullName,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _getRoleLabel(_role),
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.grey[100]!),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Thông tin cá nhân',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Chỉnh sửa',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        _infoRow('HỌ VÀ TÊN', _fullName),
                        _infoRow('EMAIL', _email),
                        _infoRow('TÊN ĐĂNG NHẬP', _userName),
                        _infoRow('VAI TRÒ', _getRoleLabel(_role)),
                        _infoRow('SỐ ĐIỆN THOẠI', 'Chưa cập nhật'),
                        _infoRow('NGÀY SINH', 'Chưa cập nhật'),
                        _infoRow('ĐỊA CHỈ', 'Chưa cập nhật'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(child: _statCard('Đơn hàng', '0', primaryColor)),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _statCard('Chi tiêu', '0đ', primaryColor),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _statCard('Điểm', '0', const Color(0xFF4DA3FF)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  _menuItem(Icons.history, 'Lịch sử mua hàng', () {}),
                  _menuItem(Icons.favorite_border, 'Sản phẩm yêu thích', () {}),
                  _menuItem(Icons.notifications_none, 'Thông báo', () {}),
                  _menuItem(Icons.security, 'Bảo mật', () {}),
                  const Divider(height: 40),
                  _menuItem(
                    Icons.logout,
                    'Đăng xuất',
                    _logout,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value.isEmpty ? 'Chưa cập nhật' : value,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _statCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[100]!),
      ),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuItem(
    IconData icon,
    String title,
    VoidCallback onTap, {
    Color color = Colors.black,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: color == Colors.red ? color : Colors.grey[600],
      ),
      title: Text(
        title,
        style: TextStyle(color: color, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.chevron_right, size: 18, color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
