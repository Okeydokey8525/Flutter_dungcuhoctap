import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final String image;
  final String category;
  final double rating;
  final int reviews;
  int quantity;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.category,
    required this.rating,
    required this.reviews,
    this.quantity = 0,
    this.isFavorite = false,
  });
}

class HomeScreen extends StatefulWidget {
  final VoidCallback onLogout;

  const HomeScreen({super.key, required this.onLogout});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;
  String _selectedCategory = 'Tất cả';
  String _searchQuery = '';
  int _cartCount = 0;
  final TextEditingController _searchController = TextEditingController();

  final List<Product> allProducts = [
    Product(
      id: 1,
      name: 'Bút Chì Như Mới',
      price: 5000,
      image: 'assets/images/pencil.png',
      category: 'Bút chì',
      rating: 4.5,
      reviews: 128,
    ),
    Product(
      id: 2,
      name: 'Bộ Tẩy Chì Hồng',
      price: 2600,
      image: 'assets/images/eraser.png',
      category: 'Tẩy',
      rating: 4.8,
      reviews: 89,
    ),
    Product(
      id: 3,
      name: 'Máy Tính Nhỏ Gọn',
      price: 25000,
      image: 'assets/images/calculator.png',
      category: 'Máy tính',
      rating: 4.3,
      reviews: 156,
    ),
    Product(
      id: 4,
      name: 'Bộ Bút Màu 24 Màu',
      price: 18600,
      image: 'assets/images/pens.png',
      category: 'Bút màu',
      rating: 4.7,
      reviews: 203,
    ),
    Product(
      id: 5,
      name: 'Giấy In A4 Trắng',
      price: 12000,
      image: 'assets/images/paper.png',
      category: 'Giấy',
      rating: 4.6,
      reviews: 342,
    ),
    Product(
      id: 6,
      name: 'Bút Chì 2B Chính Hãng',
      price: 5500,
      image: 'assets/images/pencil.png',
      category: 'Bút chì',
      rating: 4.5,
      reviews: 128,
    ),
  ];

  late List<Product> displayedProducts;

  @override
  void initState() {
    super.initState();
    displayedProducts = List.from(allProducts);
    _updateCartCount();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _updateCartCount() {
    _cartCount = allProducts.fold(0, (sum, p) => sum + p.quantity);
  }

  void _filterProducts() {
    setState(() {
      displayedProducts = allProducts.where((product) {
        bool matchesCategory =
            _selectedCategory == 'Tất cả' ||
            product.category == _selectedCategory;
        bool matchesSearch = product.name.toLowerCase().contains(
          _searchQuery.toLowerCase(),
        );
        return matchesCategory && matchesSearch;
      }).toList();
    });
  }

  void _toggleFavorite(Product product) {
    setState(() {
      product.isFavorite = !product.isFavorite;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          product.isFavorite
              ? 'Thêm "${product.name}" vào yêu thích'
              : 'Xóa khỏi yêu thích',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _addToCart(Product product) {
    setState(() {
      product.quantity++;
      _updateCartCount();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Đã thêm ${product.name} vào giỏ hàng'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  List<Product> _getFavoriteProducts() {
    return allProducts.where((p) => p.isFavorite).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: _buildAppBar(),
      body: _buildTabContent(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTab) {
      case 0:
        return _buildHomeTab();
      case 1:
        return _buildSearchTab();
      case 2:
        return _buildFavoritesTab();
      case 3:
        return _buildAccountTab();
      default:
        return _buildHomeTab();
    }
  }

  Widget _buildHomeTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildSearchBar(),
          ),
          _buildBannerSection(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: _buildCategoriesSection(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: displayedProducts.length,
              itemBuilder: (context, index) {
                return _buildProductCard(displayedProducts[index]);
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSearchTab() {
    return Column(
      children: [
        Padding(padding: const EdgeInsets.all(16.0), child: _buildSearchBar()),
        Expanded(
          child: displayedProducts.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search_off, size: 64, color: Colors.grey[300]),
                      const SizedBox(height: 16),
                      Text(
                        'Không tìm thấy sản phẩm',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                )
              : GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: displayedProducts.length,
                  itemBuilder: (context, index) {
                    return _buildProductCard(displayedProducts[index]);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildFavoritesTab() {
    final favorites = _getFavoriteProducts();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Sản phẩm yêu thích (${favorites.length})',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF003D82),
            ),
          ),
        ),
        Expanded(
          child: favorites.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 64,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Chưa có sản phẩm yêu thích',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                )
              : GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    return _buildProductCard(favorites[index]);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildAccountTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: const Color(0xFF003D82),
            child: const Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 24),
          const Text(
            'Nguyễn Văn A',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'nguyenvana@gmail.com',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 32),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('Đơn hàng của tôi'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Xem đơn hàng đã mua')),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Cài đặt'),
            onTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Mở cài đặt')));
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Trợ giúp'),
            onTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Liên hệ hỗ trợ')));
            },
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: widget.onLogout,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: const Text(
              'Đăng xuất',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: AppBar(
        backgroundColor: const Color(0xFF003D82),
        elevation: 0,
        title: const Text(
          'HUIT STATIONERY',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Giỏ hàng: $_cartCount sản phẩm')),
                  );
                },
              ),
              if (_cartCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      '$_cartCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                widget.onLogout();
              } else if (value == 'profile') {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Xem hồ sơ')));
              }
            },
            itemBuilder: (context) => <PopupMenuEntry<String>>[
              const PopupMenuItem(value: 'profile', child: Text('Hồ sơ')),
              const PopupMenuDivider(),
              const PopupMenuItem(
                value: 'logout',
                child: Text('Đăng xuất', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      onChanged: (value) {
        _searchQuery = value;
        if (_selectedTab == 0 || _selectedTab == 1) {
          _filterProducts();
        }
      },
      decoration: InputDecoration(
        hintText: 'Tìm kiếm sản phẩm...',
        hintStyle: const TextStyle(color: Color(0xFFCCCCCC)),
        prefixIcon: const Icon(Icons.search, color: Color(0xFF999999)),
        suffixIcon: _searchQuery.isNotEmpty
            ? GestureDetector(
                onTap: () {
                  _searchController.clear();
                  _searchQuery = '';
                  _filterProducts();
                },
                child: const Icon(Icons.clear, color: Color(0xFF999999)),
              )
            : null,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }

  Widget _buildBannerSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF003D82),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Định Cao Của Sự Chính Xác',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Khám phá bộ sưu tập stationery cao cấp của chúng tôi',
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: const Text(
              'Xem Ngay',
              style: TextStyle(
                color: Color(0xFF003D82),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesSection() {
    final categories = [
      'Tất cả',
      'Bút chì',
      'Tẩy',
      'Máy tính',
      'Bút màu',
      'Giấy',
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories
            .map(
              (category) => Padding(
                padding: const EdgeInsets.only(right: 12),
                child: FilterChip(
                  label: Text(category),
                  selected: _selectedCategory == category,
                  onSelected: (selected) {
                    setState(() {
                      _selectedCategory = category;
                      _filterProducts();
                    });
                  },
                  selectedColor: const Color(0xFF003D82),
                  labelStyle: TextStyle(
                    color: _selectedCategory == category
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  backgroundColor: Colors.grey[200],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildProductCard(Product product) {
  return GestureDetector(
    onTap: () {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Xem chi tiết: ${product.name}')),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Center(
              child: Icon(Icons.image, size: 40, color: Colors.grey[400]),
            ),
          ),

          // Info
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),

                Row(
                  children: [
                    const Icon(Icons.star, size: 12, color: Color(0xFFFFB800)),
                    const SizedBox(width: 4),
                    Text('${product.rating}', style: const TextStyle(fontSize: 11)),
                    const SizedBox(width: 2),
                    Text('(${product.reviews})',
                        style: const TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),

                const SizedBox(height: 6),

                Text(
                  '₫${product.price.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF003D82),
                  ),
                ),

                const SizedBox(height: 8),

                SizedBox(
                  width: double.infinity,
                  height: 28,
                  child: ElevatedButton(
                    onPressed: () => _addToCart(product),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF003D82),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text(
                      'Thêm vào giỏ',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: _selectedTab,
      onTap: (index) {
        setState(() => _selectedTab = index);
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF003D82),
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Tìm kiếm'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Yêu thích'),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Tài khoản',
        ),
      ],
    );
  }
}
