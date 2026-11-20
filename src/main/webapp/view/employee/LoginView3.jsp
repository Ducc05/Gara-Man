<%@ page import="dao.EmployeeDAO3, model.Employee3, model.Manager3" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
String error = null;
if ("POST".equalsIgnoreCase(request.getMethod())) {
  try {
    Manager3 manager = new EmployeeDAO3().checkLogin(
        new Employee3(request.getParameter("username"), request.getParameter("password")));
    if (manager != null) {
      session.setAttribute("manager", manager);
      response.sendRedirect("ManagerMainView3.jsp");
      return;
    }
    error = "Tên đăng nhập hoặc mật khẩu không đúng, hoặc tài khoản không có quyền MANAGER.";
  } catch (Exception e) {
    error = "Không thể đăng nhập. Kiểm tra kết nối cơ sở dữ liệu.";
  }
}
%>
<!doctype html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <title>Đăng nhập | Gara Man</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css" />
  </head>
  <body>
    <%@ include file="../common/header.jspf" %>
    <main>
      <section class="card" style="max-width: 500px; margin: auto">
        <h1>Đăng nhập quản lý</h1>
        <p class="sub">Đăng nhập để xem báo cáo doanh thu.</p>
        <% if (error != null) { %>
        <div class="error"><%= error %></div>
        <% } %>
        <form method="post">
          <label>Tên đăng nhập</label>
          <input name="username" required autocomplete="username" />
          <label>Mật khẩu</label>
          <input type="password" name="password" required autocomplete="current-password" />
          <div class="actions">
            <button class="btn" type="submit">Đăng nhập</button>
          </div>
        </form>
      </section>
    </main>
  </body>
</html>
