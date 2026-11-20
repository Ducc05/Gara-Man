<%@ page import="dao.InvoiceDAO3, model.Invoice3, java.time.format.DateTimeFormatter" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/managerAuth.jspf" %>
<%
String invoiceId = request.getParameter("invoiceId");
String itemId = request.getParameter("itemId");
String itemType = request.getParameter("itemType");
String start = request.getParameter("startDate");
String end = request.getParameter("endDate");
DateTimeFormatter dateTimeFormat = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
Invoice3 invoice = null;
try {
  invoice = new InvoiceDAO3().getInvoiceDetail(Integer.parseInt(invoiceId));
} catch (Exception ignored) {
  // The page below reports that the invoice could not be loaded.
}
String back = "ItemUsageListView3.jsp?itemId=" + itemId + "&itemType=" + itemType
    + "&startDate=" + start + "&endDate=" + end;
%>
<!doctype html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <title>Chi tiết hóa đơn | Gara Man</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css" />
  </head>
  <body>
    <%@ include file="../common/header.jspf" %>
    <main>
      <section class="card">
        <div class="toolbar">
          <div>
            <h1>Chi tiết hóa đơn</h1>
            <p class="sub"><%= invoice == null ? "Không tìm thấy hóa đơn." : invoice.getInvoiceCode() %></p>
          </div>
          <a id="subBack" class="btn secondary" href="<%= back %>">Quay lại danh sách</a>
        </div>
        <% if (invoice != null) { %>
        <div id="outInvoiceInfo" class="grid">
          <p><b>Mã hóa đơn:</b> <%= invoice.getInvoiceCode() %></p>
          <p><b>Ngày thanh toán:</b> <%= invoice.getPaidAt().format(dateTimeFormat) %></p>
          <p><b>Khách hàng:</b> <%= invoice.getCustomerName() %></p>
          <p><b>Số điện thoại:</b> <%= invoice.getCustomerPhone().isBlank() ? "Chưa có" : invoice.getCustomerPhone() %></p>
          <p><b>Biển số:</b> <%= invoice.getLicensePlate() %></p>
          <p><b>Nhân viên thu ngân:</b> <%= invoice.getCashierName().isBlank() ? "Chưa có" : invoice.getCashierName() %></p>
          <p><b>Nhân viên sửa chữa:</b> <%= invoice.getTechnicianName().isBlank() ? "Chưa có" : invoice.getTechnicianName() %></p>
          <p><b>Tổng tiền:</b> <%= invoice.getTotalAmount() %> VNĐ</p>
        </div>
        <table id="outInvoiceDetailList">
          <thead>
            <tr><th>STT</th><th>Loại</th><th>Tên mục</th><th>ĐVT</th><th>Số lượng</th><th>Đơn giá</th><th>Thành tiền</th></tr>
          </thead>
          <tbody>
            <% int lineIndex = 1; for (Invoice3.InvoiceLine3 line : invoice.getLines()) { %>
            <tr>
              <td><%= lineIndex++ %></td>
              <td><%= line.getDisplayType() %></td>
              <td><%= line.getName() %></td>
              <td><%= line.getUnit() %></td>
              <td><%= line.getQuantity() %></td>
              <td><%= line.getUnitPrice() %></td>
              <td><%= line.getTotalPrice() %></td>
            </tr>
            <% } %>
          </tbody>
        </table>
        <% } %>
      </section>
    </main>
  </body>
</html>
