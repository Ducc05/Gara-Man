<%@ page import="dao.AppointmentDAO3, java.time.LocalDate" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
  try {
    String[] selectedIds = request.getParameterValues("serviceIds");
    int[] serviceIds = selectedIds == null
        ? new int[0]
        : java.util.Arrays.stream(selectedIds).mapToInt(Integer::parseInt).toArray();

    new AppointmentDAO3().createAppointment(
        java.sql.Date.valueOf(LocalDate.parse(request.getParameter("appointmentDate"))),
        request.getParameter("problemDescription"),
        request.getParameter("customerName"),
        request.getParameter("customerPhone"),
        request.getParameter("customerEmail"),
        request.getParameter("customerAddress"),
        request.getParameter("licensePlate"),
        request.getParameter("carBrand"),
        request.getParameter("carModel"),
        Integer.parseInt(request.getParameter("manufactureYear")),
        Integer.parseInt(request.getParameter("shiftId")),
        serviceIds);
%>
<!doctype html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css" />
    <title>Đặt lịch thành công</title>
  </head>
  <body>
    <%@ include file="../common/header.jspf" %>
    <main>
      <section class="card">
        <h1>Đặt lịch thành công</h1>
        <div class="success">Lịch hẹn của bạn đã được gửi và đang chờ xác nhận.</div>
        <button class="btn" onclick="location.href='CustomerMainView3.jsp'">OK</button>
      </section>
    </main>
  </body>
</html>
<%
  } catch (Exception e) {
%>
<!doctype html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css" />
    <title>Lỗi đặt lịch</title>
  </head>
  <body>
    <%@ include file="../common/header.jspf" %>
    <main>
      <section class="card">
        <h1>Chưa thể lưu lịch hẹn</h1>
        <div class="error">Kiểm tra thông tin và kết nối cơ sở dữ liệu rồi thử lại.</div>
        <a class="btn secondary" href="javascript:history.back()">Quay lại</a>
      </section>
    </main>
  </body>
</html>
<%
  }
}
%>
