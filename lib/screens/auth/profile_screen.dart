import 'package:flutter/material.dart';
import '../home/main_layout.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF0B3C8C);
    const bgColor = Color(0xFFF5F9FF);

    return MainLayout(
      title: 'Hồ sơ cá nhân',
      showBackButton: true,
      child: Container(
        color: bgColor,
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
                        color: primaryColor.withOpacity(0.2),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'NA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nguyễn Văn A',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Thành viên Bạc',
                      style: TextStyle(color: Colors.grey),
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
                  _infoRow('HỌ VÀ TÊN', 'Nguyễn Văn A'),
                  _infoRow('EMAIL', 'example@gmail.com'),
                  _infoRow('SỐ ĐIỆN THOẠI', '0901 234 567'),
                  _infoRow('NGÀY SINH', '01/01/2000'),
                  _infoRow('ĐỊA CHỈ', '140 Lê Trọng Tấn, Tân Phú, TP.HCM'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: _statCard('Đơn hàng', '12', primaryColor)),
                const SizedBox(width: 16),
                Expanded(child: _statCard('Chi tiêu', '1.250k', primaryColor)),
                const SizedBox(width: 16),
                Expanded(
                  child: _statCard('Điểm', '450', const Color(0xFF4DA3FF)),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _menuItem(
              Icons.history,
              'Lịch sử mua hàng',
              () => Navigator.pushNamed(context, '/orders'),
            ),
            _menuItem(Icons.favorite_border, 'Sản phẩm yêu thích', () {}),
            _menuItem(Icons.notifications_none, 'Thông báo', () {}),
            _menuItem(Icons.security, 'Bảo mật', () {}),
            const Divider(height: 40),
            _menuItem(Icons.logout, 'Đăng xuất', () {
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            }, color: Colors.red),
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
            value,
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
