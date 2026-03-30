
# 🖊️ Đồ Án Lập Trình Di Động: App Văn Phòng Phẩm (Deli & Thiên Long)

Dự án xây dựng ứng dụng thương mại điện tử chuyên về văn phòng phẩm, kết hợp phong cách tối giản của **Deli** và sự tiện dụng của **Thiên Long**. Ứng dụng được phát triển bằng **Flutter** và kết nối hệ thống **Firebase Real-time**.

## 🚀 Công Nghệ Sử Dụng
* **Framework:** Flutter (Dart)
* **Backend:** Firebase (Authentication, Cloud Firestore, Firebase Storage)
* **Quản lý trạng thái:** Provider / GetX
* **Database cục bộ:** SQLite (sqflite)
* **Công cụ quản lý:** Git, GitHub, VS Code

## 📂 Cấu Trúc Thư Mục Hệ Thống
Để đảm bảo tính mở rộng và dễ dàng bảo trì, mã nguồn của dự án được tổ chức theo mô hình phân lớp chuyên nghiệp trong thư mục `lib`. 

Khởi đầu là thư mục `constants`, nơi quản lý tập trung các tài nguyên dùng chung như bảng màu đặc trưng (Deli-Red, ThienLong-Blue) và các đường dẫn hình ảnh. Trái tim của ứng dụng nằm ở thư mục `models`, nơi định nghĩa chặt chẽ cấu trúc dữ liệu cho sản phẩm, người dùng và đơn hàng. Song song đó, thư mục `providers` đóng vai trò là bộ não điều hành, xử lý toàn bộ logic nghiệp vụ và quản lý trạng thái của ứng dụng.

Phần giao diện người dùng (UI) được chia nhỏ trong thư mục `screens` theo từng cụm tính năng biệt lập như Xác thực, Trang chủ, Giỏ hàng và khu vực Quản trị (Admin). Các dịch vụ kết nối ngoại vi như Firebase Auth, Firestore và Storage được đóng gói tinh gọn trong thư mục `services`. Cuối cùng, thư mục `widgets` chứa đựng các linh kiện giao diện có khả năng tái sử dụng cao, giúp tối ưu hóa mã nguồn và đảm bảo tính đồng bộ về mặt thẩm mỹ cho toàn bộ ứng dụng.

## 👥 Phân Công Nhiệm Vụ (Team Members)

Nhóm thực hiện dự án bao gồm 4 thành viên với các vai trò được chuyên môn hóa để tối ưu hóa quy trình phát triển:

**Ku** đóng vai trò là kỹ sư hạ tầng, chịu trách nhiệm thiết lập nền móng ban đầu cho dự án. Nhiệm vụ chính bao gồm cấu hình hệ thống Firebase, thiết lập cơ sở dữ liệu SQLite cục bộ và xây dựng các dịch vụ xác thực căn bản, đảm bảo môi trường phát triển luôn ổn định trên cả Android và iOS.

**Quốc Cảnh** tập trung vào trải nghiệm người dùng (Frontend Dev). Thành viên này chịu trách nhiệm hiện thực hóa các bản vẽ giao diện thành mã nguồn, xây dựng trang chủ sinh động, chi tiết sản phẩm và hệ thống Widget tùy chỉnh, tạo nên diện mạo chỉn chu và tối giản cho ứng dụng.

**Lê Đức Lương (Thành viên 3)** đảm nhận vai trò kiến trúc sư Logic và Dữ liệu. Trọng tâm công việc là xây dựng hệ thống Models dữ liệu phức tạp, vận hành các Providers để điều phối luồng mua hàng, xử lý logic giỏ hàng thời gian thực và đảm bảo quy trình thanh toán diễn ra chính xác và an toàn.

**Đặng Quang** phụ trách mảng Quản trị và Đa phương tiện. Nhiệm vụ bao gồm thiết lập bảng điều khiển Dashboard dành cho Admin để quản lý kho hàng, xây dựng hệ thống lịch sử đơn hàng và xử lý các kỹ thuật nâng cao như chụp ảnh, quay video review sản phẩm để upload lên hệ thống lưu trữ đám mây Firebase Storage.

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
