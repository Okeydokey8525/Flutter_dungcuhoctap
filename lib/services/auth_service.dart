import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/api_constants.dart';

class AuthService {
  Future<Map<String, dynamic>> login(
    String login,
    String password, {
    bool rememberMe = true,
  }) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}/Auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'login': login,
        'password': password,
        'rememberMe': rememberMe,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception(data['message'] ?? 'Đăng nhập thất bại');
    }
  }

  Future<Map<String, dynamic>> register(
    String userName,
    String password,
    String email,
    String fullName,
  ) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}/Auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'userName': userName,
        'password': password,
        'email': email,
        'fullName': fullName,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data;
    }

    if (data['errors'] != null) {
      if (data['errors']['Password'] != null) {
        throw Exception(data['errors']['Password'][0]);
      }
      if (data['errors']['Email'] != null) {
        throw Exception(data['errors']['Email'][0]);
      }
      if (data['errors']['UserName'] != null) {
        throw Exception(data['errors']['UserName'][0]);
      }
      if (data['errors']['FullName'] != null) {
        throw Exception(data['errors']['FullName'][0]);
      }
    }

    throw Exception(data['message'] ?? 'Đăng ký thất bại');
  }
}
