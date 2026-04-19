import 'package:flutter/material.dart';
import 'main_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final Color primaryColor = const Color(0xFF0B3C8C);
  final Color secondaryColor = const Color(0xFF1E5BB8);
  final Color accentColor = const Color(0xFF4DA3FF);
  final Color bgColor = const Color(0xFFF5F9FF);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Trang chủ',
      showBackButton: false,
      drawer: _buildDrawer(context),
      bottomNavigationBar: _buildBottomNavigationBar(context),
      child: Container(
        color: bgColor,
        child: Column(
          children: [
            _buildHeroSection(context),
            _buildCategoriesSection(context),
            _buildTrendingProductsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: primaryColor.withOpacity(0.05)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.edit_note, color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'HUIT',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildDrawerItem(Icons.home, 'Trang chủ', true, () {}),
            _buildDrawerItem(Icons.inventory_2, 'Sản phẩm', false, () {
              Navigator.pushNamed(context, '/home');
            }),
            _buildDrawerItem(Icons.shopping_cart, 'Giỏ hàng', false, () {
              Navigator.pushNamed(context, '/cart');
            }),
            _buildDrawerItem(Icons.history, 'Đơn hàng', false, () {
              Navigator.pushNamed(context, '/orders');
            }),
            _buildDrawerItem(Icons.person, 'Tài khoản', false, () {
              Navigator.pushNamed(context, '/profile');
            }),
            const Spacer(),
            const Divider(),
            _buildDrawerItem(Icons.logout, 'Đăng xuất', false, () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            }, isDestructive: true),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    IconData icon,
    String title,
    bool isSelected,
    VoidCallback onTap, {
    bool isDestructive = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isDestructive
            ? Colors.red
            : (isSelected ? primaryColor : Colors.grey[600]),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          color: isDestructive
              ? Colors.red
              : (isSelected ? primaryColor : Colors.grey[800]),
        ),
      ),
      onTap: onTap,
      tileColor: isSelected ? primaryColor.withOpacity(0.05) : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.auto_awesome, size: 16, color: accentColor),
                const SizedBox(width: 8),
                Text(
                  'CHÀO MỪNG NĂM HỌC MỚI 2026',
                  style: TextStyle(
                    color: accentColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                color: Color(0xFF0F172A),
                height: 1.1,
              ),
              children: [
                const TextSpan(text: 'Sáng tạo hơn với '),
                TextSpan(
                  text: 'Văn phòng phẩm',
                  style: TextStyle(color: primaryColor),
                ),
                const TextSpan(text: ' chất lượng'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Khám phá bộ sưu tập dụng cụ học tập đa dạng, hiện đại giúp bạn bứt phá trong học tập và công việc.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/product_list');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  shadowColor: primaryColor.withOpacity(0.4),
                ),
                child: const Row(
                  children: [
                    Text(
                      'Mua sắm ngay',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, size: 18),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: primaryColor,
                  side: BorderSide(color: primaryColor, width: 2),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Bộ sưu tập',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 12,
            children: [
              _buildStatItem('10k+', 'Sản phẩm'),
              _buildStatItem('5k+', 'Khách hàng'),
              _buildStatItem('4.9/5', 'Đánh giá'),
            ],
          ),
          const SizedBox(height: 40),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              'https://images.unsplash.com/photo-1583485088034-697b5bc54ccd?auto=format&fit=crop&q=80&w=1000',
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
      ],
    );
  }

  Widget _buildCategoriesSection(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'icon': Icons.edit, 'title': 'Bút viết'},
      {'icon': Icons.book, 'title': 'Sổ tay'},
      {'icon': Icons.content_cut, 'title': 'Dụng cụ cắt'},
      {'icon': Icons.folder, 'title': 'Bìa hồ sơ'},
      {'icon': Icons.calculate, 'title': 'Máy tính'},
      {'icon': Icons.palette, 'title': 'Họa cụ'},
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Danh mục nổi bật',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Tìm kiếm nhanh theo nhu cầu của bạn',
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/product_list');
                },
                child: Row(
                  children: [
                    Text(
                      'Xem tất cả',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.chevron_right, size: 18, color: primaryColor),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 24,
              childAspectRatio: 0.7,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        categories[index]['icon'],
                        color: primaryColor,
                        size: 32,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    categories[index]['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingProductsSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sản phẩm bán chạy',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Những lựa chọn được yêu thích nhất tuần này',
            style: TextStyle(color: Colors.grey[500]),
          ),
          const SizedBox(height: 32),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.65,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return _buildProductCard(context, index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, int index) {
    final List<Map<String, String>> products = [
      {
        'name': 'Bút Bi Cao Cấp HUIT Blue Edition',
        'price': '25.000đ',
        'image': 'https://picsum.photos/id/250/500/500',
        'category': 'Bút viết',
      },
      {
        'name': 'Sổ Tay Lò Xo A5 - 200 Trang',
        'price': '45.000đ',
        'image': 'https://picsum.photos/id/1025/500/500',
        'category': 'Sổ tay',
      },
      {
        'name': 'Bộ Màu Nước 24 Màu',
        'price': '120.000đ',
        'image': 'https://picsum.photos/id/1062/500/500',
        'category': 'Họa cụ',
      },
      {
        'name': 'Kéo Thủ Công Chống Gỉ',
        'price': '15.000đ',
        'image': 'https://picsum.photos/id/237/500/500',
        'category': 'Dụng cụ cắt',
      },
    ];

    final product = products[index % products.length];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[100]!),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Image.network(
                    product['image']!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: const Center(
                          child: Icon(
                            Icons.broken_image,
                            color: Colors.grey,
                            size: 40,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      product['category']!,
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, size: 12, color: Colors.yellow),
                    const Icon(Icons.star, size: 12, color: Colors.yellow),
                    const Icon(Icons.star, size: 12, color: Colors.yellow),
                    const Icon(Icons.star, size: 12, color: Colors.yellow),
                    const Icon(Icons.star, size: 12, color: Colors.yellow),
                    const SizedBox(width: 4),
                    Text(
                      '(128)',
                      style: TextStyle(fontSize: 10, color: Colors.grey[400]),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  product['name']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color(0xFF1E293B),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product['price']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: primaryColor,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 18,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      color: const Color(0xFF0F172A),
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 40),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.edit_note, color: Colors.white),
              ),
              const SizedBox(width: 12),
              const Text(
                'HUIT Stationery',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Cung cấp giải pháp văn phòng phẩm toàn diện cho học tập và làm việc chuyên nghiệp.',
            style: TextStyle(color: Colors.grey, height: 1.6),
          ),
          const SizedBox(height: 40),
          _buildFooterSection(context, 'Liên kết', [
            {'label': 'Trang chủ', 'route': '/home'},
            {'label': 'Sản phẩm', 'route': '/home'},
            {'label': 'Về chúng tôi', 'route': '/about'},
            {'label': 'Liên hệ', 'route': '/contact'},
          ]),
          const SizedBox(height: 32),
          _buildFooterSection(context, 'Hỗ trợ', [
            {'label': 'Chính sách đổi trả', 'route': '/home'},
            {'label': 'Chính sách bảo mật', 'route': '/home'},
            {'label': 'Điều khoản dịch vụ', 'route': '/home'},
            {'label': 'Câu hỏi thường gặp', 'route': '/home'},
          ]),
          const SizedBox(height: 40),
          const Divider(color: Colors.grey),
          const SizedBox(height: 20),
          const Text(
            '© 2024 HUIT Stationery. All rights reserved.',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterSection(
    BuildContext context,
    String title,
    List<Map<String, String>> links,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        ...links.map(
          (linkData) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, linkData['route']!);
              },
              child: Text(
                linkData['label']!,
                style: const TextStyle(color: Colors.grey, height: 1.8),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey[600],
      onTap: (index) {
        final routes = [
          '/home',
          '/product_list',
          '/cart',
          '/orders',
          '/profile',
        ];
        final target = routes[index];
        if (target != '/home') {
          Navigator.pushNamed(context, target);
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.inventory_2_outlined),
          label: 'Sản phẩm',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Giỏ hàng',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long_outlined),
          label: 'Đơn hàng',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Tài khoản',
        ),
      ],
    );
  }
}
