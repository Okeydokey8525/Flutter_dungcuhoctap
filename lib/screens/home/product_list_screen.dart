import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  final Color primaryColor = const Color(0xFF0B3C8C);
  final Color accentColor = const Color(0xFF4DA3FF);
  final Color bgColor = const Color(0xFFF5F9FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Sản phẩm',
          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: primaryColor),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.filter_list, color: primaryColor),
            onPressed: () {},
          ),
        ],
      ),
      body: Row(
        children: [
          // Sidebar Filters (Visible on larger screens, hidden on mobile)
          // For mobile, we'll use a SingleChildScrollView with a Column
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBreadcrumb(),
                  const SizedBox(height: 24),
                  _buildHeader(),
                  const SizedBox(height: 24),
                  _buildProductGrid(context),
                  const SizedBox(height: 40),
                  _buildPagination(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreadcrumb() {
    return Row(
      children: [
        Text('Trang chủ', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
        Icon(Icons.chevron_right, size: 14, color: Colors.grey[400]),
        const Text('Sản phẩm', style: TextStyle(color: Color(0xFF0F172A), fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                children: [
                  const TextSpan(text: 'Tất cả sản phẩm '),
                  TextSpan(
                    text: '(48)',
                    style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.normal, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: 'Mới nhất',
              icon: const Icon(Icons.keyboard_arrow_down, size: 20),
              style: const TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.bold, fontSize: 14),
              onChanged: (String? newValue) {},
              items: <String>['Mới nhất', 'Giá thấp đến cao', 'Giá cao đến thấp', 'Bán chạy nhất']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.65,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return _buildProductCard(context, index);
      },
    );
  }

  Widget _buildProductCard(BuildContext context, int index) {
    final List<Map<String, String>> products = [
      {
        'name': 'Bút Bi Cao Cấp HUIT Blue Edition',
        'price': '25.000đ',
        'image': 'https://images.unsplash.com/photo-1585336139118-132f7f215b2e?auto=format&fit=crop&q=80&w=500',
        'category': 'Bút viết'
      },
      {
        'name': 'Sổ Tay Lò Xo A5 - 200 Trang',
        'price': '45.000đ',
        'image': 'https://images.unsplash.com/photo-1531346878377-a5be20888e57?auto=format&fit=crop&q=80&w=500',
        'category': 'Sổ tay'
      },
      {
        'name': 'Bộ Màu Nước 24 Màu',
        'price': '120.000đ',
        'image': 'https://images.unsplash.com/photo-1516962215378-7fa2e137ae93?auto=format&fit=crop&q=80&w=500',
        'category': 'Họa cụ'
      },
      {
        'name': 'Kéo Thủ Công Chống Gỉ',
        'price': '15.000đ',
        'image': 'https://images.unsplash.com/photo-1586075010633-2442dc3d875f?auto=format&fit=crop&q=80&w=500',
        'category': 'Dụng cụ cắt'
      },
    ];

    final product = products[index % products.length];

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product_detail');
      },
      child: Container(
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
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.network(
                      product['image']!,
                      width: double.infinity,
                      fit: BoxFit.cover,
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
                      child: const Icon(Icons.favorite_border, size: 16, color: Colors.grey),
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
                      Text('(128)', style: TextStyle(fontSize: 10, color: Colors.grey[400])),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product['name']!,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF1E293B)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product['price']!,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: primaryColor),
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.shopping_cart_outlined, size: 18, color: primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPagination() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPageButton(Icons.chevron_left, false),
        _buildPageButton('1', true),
        _buildPageButton('2', false),
        _buildPageButton('3', false),
        _buildPageButton(Icons.chevron_right, false),
      ],
    );
  }

  Widget _buildPageButton(dynamic content, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ? primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isSelected ? primaryColor : Colors.grey[200]!),
      ),
      child: Center(
        child: content is IconData
            ? Icon(content, size: 20, color: isSelected ? Colors.white : Colors.grey[600])
            : Text(
                content.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.grey[800],
                ),
              ),
      ),
    );
  }
}
