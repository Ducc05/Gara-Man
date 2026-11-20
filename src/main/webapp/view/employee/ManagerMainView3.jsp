<%@ page import="model.Manager3" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/managerAuth.jspf" %>
<!doctype html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <title>Trang quản lý | Gara Man</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css" />
  </head>
  <body>
    <%@ include file="../common/header.jspf" %>
    <main>
      <section class="card">
        <h1>Trang quản lý</h1>
        <p class="sub">Xin chào, <%= ((Manager3) session.getAttribute("manager")).getFullName() %></p>
        <a id="subViewReport" class="btn" href="SelectReportTypeView3.jsp">Xem báo cáo</a>
        <a class="btn secondary" href="Logout3.jsp">Đăng xuất</a>
      </section>
    </main>
  </body>
</html>
