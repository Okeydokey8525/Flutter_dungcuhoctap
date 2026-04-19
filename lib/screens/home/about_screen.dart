import 'package:flutter/material.dart';
import 'main_layout.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF0B3C8C);

    return MainLayout(
      title: 'Về HUIT Stationery',
      showBackButton: true,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
              color: Colors.white,
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        color: const Color(0xFF0F172A),
                        letterSpacing: -1,
                      ),
                      children: const [
                        TextSpan(text: 'Về '),
                        TextSpan(
                          text: 'HUIT Stationery',
                          style: TextStyle(color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Chúng tôi là đơn vị cung cấp văn phòng phẩm hàng đầu cho sinh viên và giảng viên tại HUIT. Sứ mệnh của chúng tôi là mang đến những công cụ sáng tạo chất lượng nhất để nâng tầm trải nghiệm học tập.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF475569),
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 48),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 20,
                    runSpacing: 12,
                    children: [
                      _buildStat('5+', 'Năm kinh nghiệm'),
                      _buildStat('10k+', 'Khách hàng'),
                      _buildStat('500+', 'Sản phẩm'),
                    ],
                  ),
                ],
              ),
            ),
            // Team Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
              child: Column(
                children: [
                  Text(
                    'Đội ngũ phát triển',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Những con người tâm huyết đứng sau dự án HUIT Stationery',
                    style: TextStyle(fontSize: 18, color: Color(0xFF64748B)),
                  ),
                  const SizedBox(height: 64),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 900) {
                        return Row(
                          children: [
                            Expanded(
                              child: _buildTeamMember(
                                'Nguyễn Văn A',
                                'UI/UX Designer',
                                'Người thổi hồn vào giao diện, đảm bảo trải nghiệm người dùng mượt mà và tinh tế nhất.',
                                'https://picsum.photos/seed/member1/200/200',
                              ),
                            ),
                            const SizedBox(width: 32),
                            Expanded(
                              child: _buildTeamMember(
                                'Trần Thị B',
                                'Frontend Developer',
                                'Chuyên gia biến các bản thiết kế thành hiện thực với những dòng code tối ưu và hiệu quả.',
                                'https://picsum.photos/seed/member2/200/200',
                              ),
                            ),
                            const SizedBox(width: 32),
                            Expanded(
                              child: _buildTeamMember(
                                'Lê Văn C',
                                'Backend Developer',
                                'Kiến trúc sư xây dựng hệ thống xử lý dữ liệu mạnh mẽ, đảm bảo tính ổn định và bảo mật.',
                                'https://picsum.photos/seed/member3/200/200',
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            _buildTeamMember(
                              'Nguyễn Văn A',
                              'UI/UX Designer',
                              'Người thổi hồn vào giao diện, đảm bảo trải nghiệm người dùng mượt mà và tinh tế nhất.',
                              'https://picsum.photos/seed/member1/200/200',
                            ),
                            const SizedBox(height: 32),
                            _buildTeamMember(
                              'Trần Thị B',
                              'Frontend Developer',
                              'Chuyên gia biến các bản thiết kế thành hiện thực với những dòng code tối ưu và hiệu quả.',
                              'https://picsum.photos/seed/member2/200/200',
                            ),
                            const SizedBox(height: 32),
                            _buildTeamMember(
                              'Lê Văn C',
                              'Backend Developer',
                              'Kiến trúc sư xây dựng hệ thống xử lý dữ liệu mạnh mẽ, đảm bảo tính ổn định và bảo mật.',
                              'https://picsum.photos/seed/member3/200/200',
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0B3C8C),
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF64748B),
          ),
        ),
      ],
    );
  }

  Widget _buildTeamMember(
    String name,
    String role,
    String bio,
    String imageUrl,
  ) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0B3C8C).withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 64,
            backgroundImage: NetworkImage(imageUrl),
            backgroundColor: Colors.white,
          ),
          const SizedBox(height: 24),
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            role.toUpperCase(),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B3C8C),
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            bio,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF64748B),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(Icons.link),
              const SizedBox(width: 16),
              _buildSocialIcon(Icons.code),
              const SizedBox(width: 16),
              _buildSocialIcon(Icons.facebook),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Icon(icon, size: 20, color: const Color(0xFF94A3B8));
  }
}
