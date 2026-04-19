import 'package:flutter/material.dart';
import 'main_layout.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF0B3C8C);
    const appBgColor = Color(0xFFF5F9FF);

    return MainLayout(
      title: 'Liên hệ với chúng tôi',
      showBackButton: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
        child: Column(
          children: [
            Text(
              'Liên hệ với chúng tôi',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w900,
                color: const Color(0xFF0F172A),
                letterSpacing: -1,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Chúng tôi luôn sẵn sàng lắng nghe và hỗ trợ bạn. Hãy gửi tin nhắn cho chúng tôi bất cứ khi nào bạn cần.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF64748B),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 64),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 900) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildContactForm(primaryColor)),
                      const SizedBox(width: 48),
                      Expanded(child: _buildContactInfo(primaryColor)),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      _buildContactForm(primaryColor),
                      const SizedBox(height: 48),
                      _buildContactInfo(primaryColor),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm(Color primaryColor) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Gửi tin nhắn',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(child: _buildTextField('Họ và tên', 'Nguyễn Văn A')),
              const SizedBox(width: 24),
              Expanded(child: _buildTextField('Email', 'example@email.com')),
            ],
          ),
          const SizedBox(height: 24),
          _buildTextField('Nội dung', 'Bạn cần hỗ trợ gì?', maxLines: 5),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 10,
                shadowColor: primaryColor.withOpacity(0.2),
              ),
              child: const Text(
                'Gửi liên hệ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF334155),
            ),
          ),
        ),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFF94A3B8)),
            filled: true,
            fillColor: const Color(0xFFF8FAFC),
            contentPadding: const EdgeInsets.all(20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Color(0xFF0B3C8C), width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfo(Color primaryColor) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: const Color(0xFFF1F5F9)),
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Thông tin liên hệ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 32),
              _buildInfoItem(
                Icons.location_on_outlined,
                'Địa chỉ',
                '140 Lê Trọng Tấn, Tây Thạnh, Tân Phú, TP.HCM',
                subtext: '(Trường Đại học Công Thương TP.HCM - HUIT)',
                primaryColor: primaryColor,
              ),
              const SizedBox(height: 24),
              _buildInfoItem(
                Icons.mail_outline,
                'Email',
                'contact@huit.edu.vn',
                subtext: 'support@stationery.huit.vn',
                primaryColor: primaryColor,
              ),
              const SizedBox(height: 24),
              _buildInfoItem(
                Icons.phone_outlined,
                'Số điện thoại',
                '(028) 3816 1673',
                subtext: '0901 234 567',
                primaryColor: primaryColor,
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Container(
          height: 320,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: const Color(0xFFF1F5F9)),
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: const Center(
              child: Text(
                'Google Maps Placeholder',
                style: TextStyle(color: Color(0xFF94A3B8)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoItem(
    IconData icon,
    String title,
    String content, {
    String? subtext,
    required Color primaryColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: primaryColor),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              Text(
                content,
                style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
              ),
              if (subtext != null)
                Text(
                  subtext,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF94A3B8),
                    fontStyle: FontStyle.italic,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
