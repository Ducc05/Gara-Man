<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%
String date = (String) request.getAttribute("appointmentDate");
String problem = (String) request.getAttribute("problemDescription");
String shift = (String) request.getAttribute("shiftId");
String[] serviceIds = (String[]) request.getAttribute("serviceIds");
pageContext.setAttribute("problem", problem);
String back = "AppointmentScheduleView3.jsp?action=checkDate&appointmentDate=" + date
    + "&selectedShiftId=" + shift;
if (problem != null) {
  back += "&problemDescription=" + java.net.URLEncoder.encode(problem, java.nio.charset.StandardCharsets.UTF_8);
}
if (serviceIds != null) {
  for (String serviceId : serviceIds) {
    back += "&serviceIds=" + serviceId;
  }
}
%>
<!doctype html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <title>Thông tin khách và xe | Gara Man</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css" />
  </head>
  <body>
    <%@ include file="../common/header.jspf" %>
    <main>
      <section class="card">
        <h1>Thông tin khách hàng và xe</h1>
        <p class="sub">Nhập thông tin để hoàn tất yêu cầu đặt lịch.</p>
        <form method="post" action="doSaveAppointment3.jsp">
          <input type="hidden" name="appointmentDate" value="<%= date %>" />
          <input type="hidden" name="problemDescription" value="${fn:escapeXml(problem)}" />
          <input type="hidden" name="shiftId" value="<%= shift %>" />
          <% if (serviceIds != null) { %>
          <% for (String serviceId : serviceIds) { %>
          <input type="hidden" name="serviceIds" value="<%= serviceId %>" />
          <% } %>
          <% } %>
          <div class="grid">
            <div>
              <label for="txtCustomerName">Họ tên</label>
              <input id="txtCustomerName" name="customerName" required maxlength="255" />
            </div>
            <div>
              <label for="txtCustomerPhone">Số điện thoại</label>
              <input id="txtCustomerPhone" name="customerPhone" required maxlength="20" />
            </div>
            <div>
              <label for="txtCustomerEmail">Email</label>
              <input id="txtCustomerEmail" name="customerEmail" type="email" maxlength="100" />
            </div>
            <div>
              <label for="txtCustomerAddress">Địa chỉ</label>
              <input id="txtCustomerAddress" name="customerAddress" maxlength="255" />
            </div>
            <div>
              <label for="txtLicensePlate">Biển số xe</label>
              <input id="txtLicensePlate" name="licensePlate" required maxlength="20" />
            </div>
            <div>
              <label for="txtCarBrand">Hãng xe</label>
              <input id="txtCarBrand" name="carBrand" required maxlength="100" />
            </div>
            <div>
              <label for="txtCarModel">Dòng xe</label>
              <input id="txtCarModel" name="carModel" required maxlength="100" />
            </div>
            <div>
              <label for="txtManufactureYear">Năm sản xuất</label>
              <input id="txtManufactureYear" name="manufactureYear" type="number" min="1900" max="2100" required />
            </div>
          </div>
          <div class="actions">
            <a id="btnBack" class="btn secondary" href="<%= back %>">Quay lại</a>
            <button id="btnConfirm" class="btn" type="submit">Xác nhận đặt lịch</button>
          </div>
        </form>
      </section>
    </main>
  </body>
</html>
