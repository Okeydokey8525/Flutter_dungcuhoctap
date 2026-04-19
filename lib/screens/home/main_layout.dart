import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  final Widget child;
  final String title;
  final bool showNavbar;
  final bool showFooter;
  final bool showBackButton;
  final Widget? drawer;
  final Widget? bottomNavigationBar;

  const MainLayout({
    super.key,
    required this.child,
    this.title = 'HUIT Stationery',
    this.showNavbar = true,
    this.showFooter = true,
    this.showBackButton = false,
    this.drawer,
    this.bottomNavigationBar,
  });

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  bool _showSearchField = false;
  final TextEditingController _searchController = TextEditingController();

  final Color primaryColor = const Color(0xFF0B3C8C);
  final Color accentColor = const Color(0xFF4DA3FF);
  final Color bgColor = const Color(0xFFF5F9FF);

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: widget.drawer,
      appBar: widget.showNavbar ? _buildAppBar(context) : null,
      bottomNavigationBar: widget.bottomNavigationBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            widget.child is Container &&
                    (widget.child as Container).child == null
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(40),
                      child: Text(
                        "UI Loaded",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : widget.child,
            if (widget.showFooter) _buildFooter(context),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white.withOpacity(0.8),
      elevation: 0,
      leading: widget.showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.grey[600],
              onPressed: () => Navigator.pop(context),
            )
          : (widget.drawer != null
                ? Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu),
                      color: Colors.grey[600],
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  )
                : null),
      bottom: _showSearchField
          ? PreferredSize(
              preferredSize: const Size.fromHeight(72),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: TextField(
                  controller: _searchController,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    hintText: 'Nhập đồ dùng cần tìm...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          _searchController.clear();
                          _showSearchField = false;
                        });
                      },
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                ),
              ),
            )
          : null,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[100]!)),
        ),
      ),
      title: Row(
        children: [
          Flexible(
            child: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [primaryColor, accentColor],
              ).createShader(bounds),
              child: const Text(
                'dung cu hoc tap',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: Colors.grey[600]),
          onPressed: () {
            setState(() {
              _showSearchField = !_showSearchField;
            });
          },
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart_outlined, color: Colors.grey[600]),
              onPressed: () => Navigator.pushNamed(context, '/cart'),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: accentColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
                child: const Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.person_outline, color: Colors.grey[600]),
          onPressed: () => Navigator.pushNamed(context, '/profile'),
        ),
        const SizedBox(width: 8),
      ],
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
                'Dung cu hoc tap',
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
            'Nâng tầm trải nghiệm học tập với những sản phẩm văn phòng phẩm tinh tế và chất lượng nhất.',
            style: TextStyle(color: Colors.grey, height: 1.6),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildSocialIcon(Icons.facebook),
              const SizedBox(width: 12),
              _buildSocialIcon(Icons.camera_alt_outlined),
              const SizedBox(width: 12),
              _buildSocialIcon(Icons.smart_display_outlined),
            ],
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF111827),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF1F2937)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildFooterSection(context, 'Sản phẩm', [
                    {'label': 'Sản phẩm', 'route': '/product_list'},
                  ]),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: _buildFooterSection(context, 'Hỗ trợ', [
                    {'label': 'Về chúng tôi', 'route': '/about'},
                    {'label': 'Liên hệ', 'route': '/contact'},
                    {'label': 'Hỗ trợ', 'route': '/contact'},
                  ]),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          const Divider(color: Colors.grey),
          const SizedBox(height: 20),
          const Text(
            '© 2024 HUIT Stationery. Tất cả quyền được bảo lưu.',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.grey[300], size: 20),
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
}
