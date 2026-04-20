import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final Color primaryColor = const Color(0xFF0B3C8C);
  final Color accentColor = const Color(0xFF4DA3FF);
  final Color bgColor = const Color(0xFFF5F9FF);
  int quantity = 1;

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
        actions: [
          IconButton(
            icon: Icon(Icons.share_outlined, color: primaryColor),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.favorite_border, color: primaryColor),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: primaryColor),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageGallery(),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProductHeader(),
                  const SizedBox(height: 24),
                  _buildPriceSection(),
                  const SizedBox(height: 24),
                  _buildDescription(),
                  const SizedBox(height: 32),
                  _buildQuantitySelector(),
                  const SizedBox(height: 32),
                  _buildActionButtons(),
                  const SizedBox(height: 40),
                  _buildFeaturesGrid(),
                  const SizedBox(height: 40),
                  _buildTabs(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageGallery() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              'https://images.unsplash.com/photo-1585336139118-132f7f215b2e?auto=format&fit=crop&q=80&w=1000',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: index == 0 ? primaryColor : Colors.grey[200]!,
                      width: index == 0 ? 2 : 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1585336139118-132f7f215b2e?auto=format&fit=crop&q=80&w=200',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'BÚT VIẾT',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: primaryColor),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Bút Bi Cao Cấp HUIT Blue Edition',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Color(0xFF0F172A), height: 1.2),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Row(
              children: List.generate(5, (index) => const Icon(Icons.star, size: 18, color: Colors.yellow)),
            ),
            const SizedBox(width: 8),
            Text('4.9 (128 đánh giá)', style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w500)),
            const Spacer(),
            const Icon(Icons.check_circle, size: 16, color: Colors.green),
            const SizedBox(width: 4),
            const Text('Còn hàng', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12)),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceSection() {
    return Text(
      '25.000đ',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: primaryColor),
    );
  }

  Widget _buildDescription() {
    return Text(
      'Bút bi cao cấp phiên bản giới hạn HUIT Blue Edition với thiết kế công thái học, mực gel trơn tru giúp bạn viết lách cả ngày không mỏi. Thân bút làm từ nhựa ABS bền bỉ, màu xanh đặc trưng của HUIT.',
      style: TextStyle(fontSize: 15, color: Colors.grey[600], height: 1.6),
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      children: [
        const Text('Số lượng:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(width: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[200]!),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove, size: 18),
                onPressed: () {
                  if (quantity > 1) setState(() => quantity--);
                },
              ),
              Text(
                quantity.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              IconButton(
                icon: const Icon(Icons.add, size: 18),
                onPressed: () => setState(() => quantity++),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 18),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            minimumSize: const Size(double.infinity, 0),
            elevation: 4,
            shadowColor: primaryColor.withOpacity(0.4),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart_outlined),
              SizedBox(width: 12),
              Text('Thêm vào giỏ hàng', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/checkout');
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: primaryColor,
            side: BorderSide(color: primaryColor, width: 2),
            padding: const EdgeInsets.symmetric(vertical: 18),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            minimumSize: const Size(double.infinity, 0),
          ),
          child: const Text('Mua ngay', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _buildFeaturesGrid() {
    return Row(
      children: [
        Expanded(
          child: _buildFeatureItem(Icons.local_shipping_outlined, 'Giao hàng nhanh', 'Trong vòng 24h'),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildFeatureItem(Icons.shield_outlined, 'Bảo hành 12 tháng', 'Lỗi 1 đổi 1'),
        ),
      ],
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[100]!),
      ),
      child: Row(
        children: [
          Icon(icon, color: primaryColor, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                Text(subtitle, style: TextStyle(fontSize: 11, color: Colors.grey[500])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildTabItem('Mô tả', true),
            _buildTabItem('Thông số', false),
            _buildTabItem('Đánh giá', false),
          ],
        ),
        const Divider(height: 1),
        const SizedBox(height: 24),
        const Text(
          'Đặc điểm nổi bật',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
        ),
        const SizedBox(height: 16),
        _buildBulletPoint('Ngòi bút 0.5mm cho nét viết thanh mảnh, sắc nét.'),
        _buildBulletPoint('Mực gel nhập khẩu từ Nhật Bản, khô nhanh, không lem.'),
        _buildBulletPoint('Đệm cao su mềm mại ở phần tay cầm giúp giảm áp lực.'),
        _buildBulletPoint('Thiết kế hiện đại, trẻ trung, phù hợp với học sinh.'),
      ],
    );
  }

  Widget _buildTabItem(String title, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: isSelected ? primaryColor : Colors.transparent, width: 2),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isSelected ? primaryColor : Colors.grey[500],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: primaryColor, shape: BoxShape.circle),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.grey[600], height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}