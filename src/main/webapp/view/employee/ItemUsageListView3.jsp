<%@ page import="dao.InvoiceDAO3, model.Invoice3, java.time.LocalDate, java.time.format.DateTimeFormatter" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/managerAuth.jspf" %>
<%
String itemId = request.getParameter("itemId");
String itemType = request.getParameter("itemType");
String start = request.getParameter("startDate");
String end = request.getParameter("endDate");
String displayStart = start;
String displayEnd = end;
DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("dd/MM/yyyy");
DateTimeFormatter dateTimeFormat = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
Invoice3[] invoices = null;
String itemLabel = "";
String error = null;
try {
  LocalDate startDate = LocalDate.parse(start);
  LocalDate endDate = LocalDate.parse(end);
  displayStart = startDate.format(dateFormat);
  displayEnd = endDate.format(dateFormat);
  InvoiceDAO3 invoiceDAO = new InvoiceDAO3();
  itemLabel = invoiceDAO.getItemLabel(Integer.parseInt(itemId), itemType);
  invoices = invoiceDAO.getInvoicesByItem(Integer.parseInt(itemId), itemType, startDate, endDate);
} catch (Exception e) {
  error = "Không thể tải danh sách hóa đơn. Kiểm tra tham số và kết nối cơ sở dữ liệu.";
}
%>
<!doctype html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <title>Hóa đơn sử dụng mục | Gara Man</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css" />
  </head>
  <body>
    <%@ include file="../common/header.jspf" %>
    <main>
      <section class="card">
        <div class="toolbar">
          <div>
            <h1>Các lần sử dụng <%= "Service".equals(itemType) ? "dịch vụ" : "phụ tùng" %></h1>
            <p class="sub">Đang chọn: <%= itemLabel %></p>
            <p class="sub">Khoảng <%= displayStart %> đến <%= displayEnd %></p>
          </div>
          <a id="subBack" class="btn secondary" href="ServiceSparePartStatView3.jsp?startDate=<%= start %>&amp;endDate=<%= end %>">Quay lại thống kê</a>
        </div>
        <% if (error != null) { %>
        <div class="error"><%= error %></div>
        <% } %>
        <table id="outItemUsageList">
          <thead>
            <tr><th>STT</th><th>Mã hóa đơn</th><th>Ngày thanh toán</th><th>Khách hàng</th><th>Số điện thoại</th><th>Biển số</th><th>Tổng tiền</th><th></th></tr>
          </thead>
          <tbody>
            <% if (invoices != null) { %>
            <% int invoiceIndex = 1; for (Invoice3 invoice : invoices) { %>
            <tr>
              <td><%= invoiceIndex++ %></td>
              <td><%= invoice.getInvoiceCode() %></td>
              <td><%= invoice.getPaidAt().format(dateTimeFormat) %></td>
              <td><%= invoice.getCustomerName() %></td>
              <td><%= invoice.getCustomerPhone().isBlank() ? "Chưa có" : invoice.getCustomerPhone() %></td>
              <td><%= invoice.getLicensePlate() %></td>
              <td><%= invoice.getTotalAmount() %> VNĐ</td>
              <td>
                <a id="selectedInvoice-<%= invoice.getId() %>" class="btn" href="InvoiceDetailView3.jsp?invoiceId=<%= invoice.getId() %>&amp;itemId=<%= itemId %>&amp;itemType=<%= itemType %>&amp;startDate=<%= start %>&amp;endDate=<%= end %>">Chi tiết</a>
              </td>
            </tr>
            <% } %>
            <% if (invoices.length == 0) { %>
            <tr><td colspan="8">Không có hóa đơn phù hợp.</td></tr>
            <% } %>
            <% } %>
          </tbody>
        </table>
      </section>
    </main>
  </body>
</html>
