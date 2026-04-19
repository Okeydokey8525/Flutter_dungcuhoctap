import 'package:flutter/material.dart';
import '../home/main_layout.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF0B3C8C);
    const bgColor = Color(0xFFF5F9FF);

    return MainLayout(
      title: 'Lịch sử mua hàng',
      showBackButton: true,
      child: Container(
        color: bgColor,
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) => _buildOrderCard(context, index, primaryColor),
        ),
      ),
    );
  }

  Widget _buildOrderCard(BuildContext context, int index, Color primaryColor) {
    final statuses = ['Đã giao', 'Đã giao', 'Đang xử lý', 'Đã hủy'];
    final statusColors = [Colors.green, Colors.green, Colors.blue, Colors.red];
    final ids = ['#HUIT-8829', '#HUIT-8752', '#HUIT-8610', '#HUIT-8544'];
    final dates = ['12/03/2024', '05/03/2024', '28/02/2024', '20/02/2024'];
    final amounts = ['200.000đ', '450.000đ', '125.000đ', '75.000đ'];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[100]!),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ids[index],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusColors[index].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  statuses[index].toUpperCase(),
                  style: TextStyle(
                    color: statusColors[index],
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ngày đặt',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    dates[index],
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Tổng tiền',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    amounts[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Divider(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/order_detail'),
                child: Text(
                  'Chi tiết',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
