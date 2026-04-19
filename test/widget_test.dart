import 'package:flutter_test/flutter_test.dart';

import 'package:app_dung_cu_hoc_tap/main.dart';

void main() {
  testWidgets('Main app shows login screen on startup', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Đăng nhập'), findsOneWidget);
    expect(find.text('Đăng nhập ngay'), findsOneWidget);
    expect(find.text('Tạo tài khoản mới'), findsOneWidget);
  });

  testWidgets('User can navigate from login to signup screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    final signupLink = find.text('Tạo tài khoản mới');
    await tester.ensureVisible(signupLink);
    await tester.tap(signupLink);
    await tester.pumpAndSettle();

    expect(find.text('Tạo tài khoản mới'), findsOneWidget);
    expect(find.text('Đăng ký tài khoản'), findsOneWidget);
    expect(find.text('Đã có tài khoản? '), findsOneWidget);
  });
}
