
# 🖊️ Đồ Án Lập Trình Di Động: App Văn Phòng Phẩm (Deli & Thiên Long)

Dự án xây dựng ứng dụng thương mại điện tử chuyên về văn phòng phẩm, kết hợp phong cách tối giản của **Deli** và sự tiện dụng của **Thiên Long**. Ứng dụng được phát triển bằng **Flutter** và kết nối hệ thống **Firebase Real-time**.

## 🚀 Công Nghệ Sử Dụng
* **Framework:** Flutter (Dart)
* **Backend:** Firebase (Authentication, Cloud Firestore, Firebase Storage)
* **Quản lý trạng thái:** Provider / GetX
* **Database cục bộ:** SQLite (sqflite)
* **Công cụ quản lý:** Git, GitHub, VS Code

## 📂 Cấu Trúc Thư Mục (Project Structure)
Dự án tuân thủ mô hình phân lớp rõ ràng để dễ dàng bảo trì và phối hợp nhóm:

lib/
├── constants/      # Quản lý màu sắc thương hiệu, Asset path (Deli-Red, TL-Blue)
├── models/         # Định nghĩa cấu trúc dữ liệu (Product, Cart, Order, User)
├── providers/      # Xử lý Logic nghiệp vụ và Quản lý trạng thái (State Management)
├── screens/        # Giao diện người dùng (Auth, Home, Cart, Checkout, Admin)
├── services/       # Kết nối Firebase (Auth, Firestore, Storage) & SQLite
├── widgets/        # Các thành phần giao diện dùng chung (Button, Input, Card)
├── main_wrapper.dart # Thanh điều hướng BottomNavigationBar
└── main.dart       # Điểm khởi chạy ứng dụng & Cấu hình Firebase

## 👥 Phân Công Nhiệm Vụ (Team Members)

| Thành viên        | Vai trò     | Nhiệm vụ chi tiết |
| **Thành viên 1** | Hạ tầng & DB | Cấu hình Firebase, SQLite, Auth Service, Setup môi trường Android/iOS. |
| **Thành viên 2** | Frontend Dev | Thiết kế UI Home, Product Detail, Auth & hệ thống Custom Widgets. |
| **Lê Đức Lương** | Logic & Data | Xây dựng Models, Providers, Logic Giỏ hàng, Thanh toán & Quản lý dữ liệu. |
| **Thành viên 4** | Admin & Media| Làm Dashboard Admin, Lịch sử đơn hàng, Xử lý Upload Ảnh/Video Review. |

## 🛠️ Hướng Dẫn Cài Đặt (Setup for Developers)

1. **Clone dự án về máy:**
   git clone [https://github.com/Okeydokey8525/Flutter_dungcuhoctap.git](https://github.com/Okeydokey8525/Flutter_dungcuhoctap.git)
  
2. **Cài đặt thư viện:**
   flutter pub get
  
3. **Cấu hình Firebase (Bắt buộc):**
   * Tải file `google-services.json` từ Firebase Console của nhóm.
   * Chép file vào thư mục: `android/app/`.

4. **Chạy ứng dụng:**
   * Mở máy ảo Android (Pixel 7) hoặc kết nối thiết bị thật.
   * Nhấn `F5` hoặc chạy lệnh `flutter run`.

## ✨ Tính Năng Chính
- [x] **Xác thực:** Đăng ký, Đăng nhập, Quên mật khẩu qua Firebase Auth.
- [x] **Cửa hàng:** Xem danh sách sản phẩm, lọc theo thương hiệu Deli/Thiên Long.
- [x] **Giỏ hàng:** Thêm/Xóa, cập nhật số lượng và tính tổng tiền thời gian thực.
- [x] **Thanh toán:** Quy trình đặt hàng và lưu trữ đơn hàng lên Cloud Firestore.
- [x] **Admin:** Quản lý kho hàng (CRUD sản phẩm), xem biểu đồ thống kê doanh thu.
- [x] **Media:** Chụp ảnh/Quay video review sản phẩm và upload lên Firebase Storage.


## 🏫 Thông Tin Học Phần
* **Trường:** Đại học Công Thương TP.HCM (HUIT)
* **Khoa:** Công Nghệ Thông Tin
* **Môn học:** Lập trình thiết bị di động
* **Giảng viên hướng dẫn:** [Điền tên Giảng viên vào đây]
* **Năm học:** 2025 - 2026
```
