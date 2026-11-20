# Gara Man

Demo JSP/Servlet cho hai module Đặt lịch hẹn trực tuyến và Thống kê doanh thu dịch vụ/phụ tùng. Yêu cầu JDK 17+, Apache Tomcat 10.1+, MySQL 8.0+ và Maven.

## 1. Cài công cụ

Kiểm tra JDK và Maven:

```bash
java --version
mvn --version
```

Trên Ubuntu, cài Maven nếu máy chưa có:

```bash
sudo apt update
sudo apt install maven
```

## 2. Khởi tạo MySQL (lần đầu)

Tại thư mục gốc dự án, chạy schema rồi dữ liệu mẫu bằng một tài khoản MySQL có quyền tạo database/user:

```bash
mysql -u root -p < sql/schema.sql
mysql -u root -p < sql/data.sql
```

Ứng dụng dùng database `garaman`, tài khoản `garaman_demo_app` và mật khẩu `garaman_demo_pw`. Script schema tạo database, tài khoản và các bảng. Script data nạp gara, dịch vụ, phụ tùng, tài khoản quản lý và hóa đơn mẫu tháng 10/2026 cùng một số hóa đơn tháng 11/2026.

Chỉ chạy hai script này khi khởi tạo DB. `mvn clean` không xóa database.

## 3. Build WAR

Tại thư mục gốc dự án:

```bash
mvn clean package
```

WAR sau build nằm ở `target/garaman.war`. Đặt đường dẫn Tomcat (sửa lại nếu bạn cài ở nơi khác), rồi chép WAR vào `webapps`:

```bash
export CATALINA_HOME="$HOME/.local/opt/tomcat"
export CATALINA_BASE="$CATALINA_HOME"
cp target/garaman.war "$CATALINA_BASE/webapps/garaman.war"
```

Tomcat mặc định dùng cổng HTTP 8080. Nếu Tomcat đang chạy và `autoDeploy="true"` trong `$CATALINA_BASE/conf/server.xml`, Tomcat sẽ tự deploy lại sau khi chép WAR mới; chờ deploy xong rồi tải lại trang. Nếu Tomcat chưa chạy, khởi động bằng:

```bash
"$CATALINA_HOME/bin/catalina.sh" run
```

Truy cập <http://localhost:8080/garaman/>. Mỗi lần sửa code, chạy lại `mvn clean package` rồi chép đè WAR theo lệnh trên. Nếu Tomcat không tự nhận bản mới, dừng Tomcat, chép WAR, rồi khởi động lại.
