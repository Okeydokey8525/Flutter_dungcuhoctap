import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignupScreen extends StatefulWidget {
  final VoidCallback onLoginTap;
  final VoidCallback onSignupSuccess;

  const SignupScreen({
    super.key,
    required this.onLoginTap,
    required this.onSignupSuccess,
  });

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _agreeTerms = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSignup() {
    if (_formKey.currentState!.validate()) {
      if (!_agreeTerms) {
        setState(
          () => _errorMessage = 'Vui lòng đồng ý với Điều khoản dịch vụ',
        );
        return;
      }

      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      // Simulate API call
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          setState(() => _isLoading = false);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Đăng ký tài khoản thành công!'),
              backgroundColor: Color(0xFF003D82),
            ),
          );
          widget.onSignupSuccess();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                // Header Logo
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFF003D82),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.shopping_bag,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(height: 24),
                // Title
                const Text(
                  'HUIT',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF003D82),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'STATIONERY',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'KIẾN TẠO SỰ CHUẨN XÁC',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 32),
                // Form Title
                const Text(
                  'Tạo tài khoản mới',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 32),
                // Error Message
                if (_errorMessage != null)
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
                // Name Field
                _buildNameField(),
                const SizedBox(height: 24),
                // Email Field
                _buildEmailField(),
                const SizedBox(height: 24),
                // Password Field
                _buildPasswordField(
                  label: 'MẬT KHẨU',
                  controller: _passwordController,
                  obscurePassword: _obscurePassword,
                  onVisibilityToggle: () {
                    setState(() => _obscurePassword = !_obscurePassword);
                  },
                ),
                const SizedBox(height: 24),
                // Confirm Password Field
                _buildPasswordField(
                  label: 'NHẬP LẠI',
                  controller: _confirmPasswordController,
                  obscurePassword: _obscureConfirmPassword,
                  onVisibilityToggle: () {
                    setState(
                      () => _obscureConfirmPassword = !_obscureConfirmPassword,
                    );
                  },
                ),
                const SizedBox(height: 24),
                // Terms Checkbox
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _agreeTerms,
                      onChanged: (value) {
                        setState(() => _agreeTerms = value ?? false);
                      },
                      activeColor: const Color(0xFF003D82),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: RichText(
                          text: TextSpan(
                            text: 'Tôi đồng ý với ',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            children: [
                              TextSpan(
                                text: 'Điều khoản dịch vụ',
                                style: const TextStyle(
                                  color: Color(0xFF003D82),
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Xem Điều khoản dịch vụ'),
                                      ),
                                    );
                                  },
                              ),
                              const TextSpan(
                                text: ' và ',
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextSpan(
                                text: 'Chính sách bảo mật',
                                style: const TextStyle(
                                  color: Color(0xFF003D82),
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Xem Chính sách bảo mật'),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleSignup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF003D82),
                      disabledBackgroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ),
                          )
                        : const Text(
                            'Đăng ký tài khoản',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 24),
                // Social Sign Up
                const Text(
                  'HOẶC TIẾP TỤC VỚI',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Đăng ký bằng Google'),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          side: const BorderSide(color: Colors.grey, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Google',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Đăng ký bằng Facebook'),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          side: const BorderSide(color: Colors.grey, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Facebook',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Đã có tài khoản? ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: widget.onLoginTap,
                      child: const Text(
                        'Đăng nhập',
                        style: TextStyle(
                          color: Color(0xFF003D82),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'HỌ VÀ TÊN',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _nameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Vui lòng nhập họ và tên';
            }
            if (value.split(' ').length < 2) {
              return 'Vui lòng nhập đầy đủ họ và tên';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: 'Nguyễn Văn A',
            hintStyle: const TextStyle(color: Color(0xFFCCCCCC), fontSize: 14),
            prefixIcon: const Icon(
              Icons.person_outline,
              color: Color(0xFF999999),
            ),
            filled: true,
            fillColor: const Color(0xFFF5F5F5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'EMAIL',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Vui lòng nhập email';
            }
            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return 'Email không hợp lệ';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: 'example@gmail.com',
            hintStyle: const TextStyle(color: Color(0xFFCCCCCC), fontSize: 14),
            prefixIcon: const Icon(
              Icons.email_outlined,
              color: Color(0xFF999999),
            ),
            filled: true,
            fillColor: const Color(0xFFF5F5F5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required bool obscurePassword,
    required VoidCallback onVisibilityToggle,
  }) {
    bool isConfirmField = label == 'NHẬP LẠI';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscurePassword,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Vui lòng nhập mật khẩu';
            }
            if (value.length < 6) {
              return 'Mật khẩu phải có ít nhất 6 ký tự';
            }
            if (isConfirmField && value != _passwordController.text) {
              return 'Mật khẩu không khớp';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: '••••••••',
            hintStyle: const TextStyle(color: Color(0xFFCCCCCC)),
            prefixIcon: const Icon(
              Icons.lock_outline,
              color: Color(0xFF999999),
            ),
            suffixIcon: GestureDetector(
              onTap: onVisibilityToggle,
              child: Icon(
                obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: const Color(0xFF999999),
              ),
            ),
            filled: true,
            fillColor: const Color(0xFFF5F5F5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
          ),
        ),
      ],
    );
  }
}
