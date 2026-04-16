import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  // ================= INIT DB =================
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('stationery.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
      onOpen: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
    );
  }

  // ================= CREATE TABLE =================
  Future _createDB(Database db, int version) async {
    // Categories
    await db.execute('''
    CREATE TABLE categories (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      icon TEXT,
      created_at TEXT DEFAULT CURRENT_TIMESTAMP
    )
    ''');

    // Products
    await db.execute('''
    CREATE TABLE products (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      price REAL NOT NULL,
      image TEXT,
      description TEXT,
      category_id INTEGER,
      brand TEXT,
      grade TEXT,
      stock INTEGER DEFAULT 0,
      created_at TEXT DEFAULT CURRENT_TIMESTAMP,
      updated_at TEXT,
      FOREIGN KEY (category_id) REFERENCES categories(id)
    )
    ''');

    // Users
    await db.execute('''
    CREATE TABLE users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT UNIQUE,
      password TEXT NOT NULL,
      email TEXT UNIQUE,
      full_name TEXT,
      phone TEXT,
      address TEXT,
      role TEXT DEFAULT 'user',
      created_at TEXT DEFAULT CURRENT_TIMESTAMP
    )
    ''');

    // Orders
    await db.execute('''
    CREATE TABLE orders (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      user_id INTEGER,
      order_code TEXT,
      total REAL,
      status TEXT DEFAULT 'pending',
      payment_method TEXT,
      shipping_address TEXT,
      created_at TEXT DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY (user_id) REFERENCES users(id)
    )
    ''');

    // Order Items
    await db.execute('''
    CREATE TABLE order_items (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      order_id INTEGER,
      product_id INTEGER,
      quantity INTEGER,
      price REAL,
      FOREIGN KEY (order_id) REFERENCES orders(id),
      FOREIGN KEY (product_id) REFERENCES products(id)
    )
    ''');

    // Index
    await db.execute(
      'CREATE INDEX idx_product_category ON products(category_id)',
    );
    await db.execute('CREATE INDEX idx_order_user ON orders(user_id)');
  }

  // ================= USER =================
  Future<int?> registerUser(Map<String, dynamic> user) async {
    final db = await instance.database;

    // check email tồn tại chưa
    final existing = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [user['email']],
    );

    if (existing.isNotEmpty) {
      // ignore: avoid_print
      print("Email đã tồn tại!");
      return null;
    }

    return await db.insert('users', user);
  }

  Future<Map<String, dynamic>?> loginUser(
    String username,
    String password,
  ) async {
    final db = await instance.database;

    final result = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );

    if (result.isNotEmpty) return result.first;
    return null;
  }

  // ================= PRODUCT =================
  Future<int> insertProduct(Map<String, dynamic> product) async {
    final db = await instance.database;
    return await db.insert('products', product);
  }

  Future<List<Map<String, dynamic>>> getAllProducts() async {
    final db = await instance.database;

    return await db.rawQuery('''
      SELECT p.*, c.name as category_name
      FROM products p
      LEFT JOIN categories c ON p.category_id = c.id
    ''');
  }

  Future<Map<String, dynamic>?> getProductById(int id) async {
    final db = await instance.database;

    final result = await db.query('products', where: 'id = ?', whereArgs: [id]);

    return result.isNotEmpty ? result.first : null;
  }

  Future<List<Map<String, dynamic>>> searchProducts(String keyword) async {
    final db = await instance.database;

    return await db.rawQuery(
      '''
      SELECT * FROM products
      WHERE name LIKE ? OR brand LIKE ?
    ''',
      ['%$keyword%', '%$keyword%'],
    );
  }

  Future<int> updateProduct(int id, Map<String, dynamic> product) async {
    final db = await instance.database;

    return await db.update(
      'products',
      product,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteProduct(int id) async {
    final db = await instance.database;

    return await db.delete('products', where: 'id = ?', whereArgs: [id]);
  }

  // ================= ORDER =================
  Future<int> createOrder(Map<String, dynamic> order) async {
    final db = await instance.database;
    return await db.insert('orders', order);
  }

  Future<int> addOrderItem(Map<String, dynamic> item) async {
    final db = await instance.database;
    return await db.insert('order_items', item);
  }

  Future<List<Map<String, dynamic>>> getOrdersByUser(int userId) async {
    final db = await instance.database;

    return await db.query(
      'orders',
      where: 'user_id = ?',
      whereArgs: [userId],
      orderBy: 'created_at DESC',
    );
  }

  Future<List<Map<String, dynamic>>> getOrderDetails(int orderId) async {
    final db = await instance.database;

    return await db.rawQuery(
      '''
      SELECT oi.*, p.name, p.image
      FROM order_items oi
      JOIN products p ON oi.product_id = p.id
      WHERE oi.order_id = ?
    ''',
      [orderId],
    );
  }

  // ================= COMMON =================
  Future<int> delete(String table, int id) async {
    final db = await instance.database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
