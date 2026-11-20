<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/managerAuth.jspf" %>
<!doctype html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <title>Chọn báo cáo | Gara Man</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css" />
  </head>
  <body>
    <%@ include file="../common/header.jspf" %>
    <main>
      <section class="card">
        <h1>Chọn loại báo cáo</h1>
        <p class="sub">Chọn báo cáo trong phạm vi demo hiện tại.</p>
        <a id="subSelectReportType" class="btn" href="ServiceSparePartStatView3.jsp">Thống kê dịch vụ / phụ tùng theo doanh thu</a>
        <div class="actions">
          <a id="subBack" class="btn secondary" href="ManagerMainView3.jsp">Quay lại</a>
        </div>
      </section>
    </main>
  </body>
</html>
