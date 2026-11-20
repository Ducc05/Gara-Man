<%@ page import="dao.ServiceSparePartStatisticsDAO3, model.ServiceSparePartStatistics3, java.time.LocalDate, java.time.format.DateTimeFormatter" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/managerAuth.jspf" %>
<%
String start = request.getParameter("startDate");
String end = request.getParameter("endDate");
String displayStart = start;
String displayEnd = end;
DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("dd/MM/yyyy");
try {
  if (start != null && !start.isBlank()) displayStart = LocalDate.parse(start).format(dateFormat);
  if (end != null && !end.isBlank()) displayEnd = LocalDate.parse(end).format(dateFormat);
} catch (Exception ignored) {
  // Invalid input is reported by the validation block below.
}
boolean submitted = start != null && !start.isBlank() && end != null && !end.isBlank();
ServiceSparePartStatistics3[] rows = null;
String error = null;
if (submitted) {
  try {
    LocalDate startDate = LocalDate.parse(start);
    LocalDate endDate = LocalDate.parse(end);
    displayStart = startDate.format(dateFormat);
    displayEnd = endDate.format(dateFormat);
    if (endDate.isBefore(startDate)) {
      error = "Ngày kết thúc phải bằng hoặc sau ngày bắt đầu.";
    } else {
      rows = new ServiceSparePartStatisticsDAO3().getServiceSparePartStatistics(startDate, endDate);
    }
  } catch (Exception e) {
    error = "Không thể tải báo cáo. Kiểm tra ngày và kết nối cơ sở dữ liệu.";
  }
}
%>
<!doctype html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <title>Thống kê doanh thu | Gara Man</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css" />
    <script src="${pageContext.request.contextPath}/js/date-input.js" defer></script>
  </head>
  <body>
    <%@ include file="../common/header.jspf" %>
    <main>
      <section class="card">
        <div class="toolbar">
          <div>
            <h1>Thống kê dịch vụ / phụ tùng</h1>
            <p class="sub">
              Doanh thu theo hóa đơn đã lập trong khoảng thời gian.
              <% if (displayStart != null && displayEnd != null) { %>
              Kỳ thống kê: <%= displayStart %> đến <%= displayEnd %>.
              <% } %>
            </p>
          </div>
          <a id="subBack" class="btn secondary" href="SelectReportTypeView3.jsp">Quay lại</a>
        </div>
        <% if (error != null) { %>
        <div class="error"><%= error %></div>
        <% } %>
        <form method="get">
          <div class="grid">
            <div>
              <label for="inStartDate">Ngày bắt đầu</label>
              <div class="date-input">
                <input id="inStartDate" data-date-text type="text" inputmode="numeric" autocomplete="off" placeholder="dd/MM/yyyy" pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}" title="Nhập ngày theo dạng dd/MM/yyyy" required value="<%= displayStart == null ? "" : displayStart %>" />
                <button class="btn secondary date-picker-button" type="button" data-date-button="inStartDatePicker" aria-label="Mở lịch" title="Chọn ngày">
                  <svg viewBox="0 0 24 24" aria-hidden="true" focusable="false">
                    <rect x="3.5" y="5" width="17" height="15.5" rx="2" />
                    <path d="M7.5 3.5v3M16.5 3.5v3M3.5 9h17M7.5 12.5h.01M12 12.5h.01M16.5 12.5h.01M7.5 16h.01M12 16h.01" />
                  </svg>
                </button>
                <input id="inStartDatePicker" class="date-picker-native" data-date-picker type="date" aria-label="Chọn ngày bắt đầu" value="<%= start == null ? "" : start %>" />
                <input id="startDate" data-date-iso type="hidden" name="startDate" value="<%= start == null ? "" : start %>" />
              </div>
            </div>
            <div>
              <label for="inEndDate">Ngày kết thúc</label>
              <div class="date-input">
                <input id="inEndDate" data-date-text type="text" inputmode="numeric" autocomplete="off" placeholder="dd/MM/yyyy" pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}" title="Nhập ngày theo dạng dd/MM/yyyy" required value="<%= displayEnd == null ? "" : displayEnd %>" />
                <button class="btn secondary date-picker-button" type="button" data-date-button="inEndDatePicker" aria-label="Mở lịch" title="Chọn ngày">
                  <svg viewBox="0 0 24 24" aria-hidden="true" focusable="false">
                    <rect x="3.5" y="5" width="17" height="15.5" rx="2" />
                    <path d="M7.5 3.5v3M16.5 3.5v3M3.5 9h17M7.5 12.5h.01M12 12.5h.01M16.5 12.5h.01M7.5 16h.01M12 16h.01" />
                  </svg>
                </button>
                <input id="inEndDatePicker" class="date-picker-native" data-date-picker type="date" aria-label="Chọn ngày kết thúc" value="<%= end == null ? "" : end %>" />
                <input id="endDate" data-date-iso type="hidden" name="endDate" value="<%= end == null ? "" : end %>" />
              </div>
            </div>
          </div>
          <div class="actions">
            <button id="subViewStat" class="btn" type="submit">Xem thống kê</button>
          </div>
        </form>
        <% if (rows != null) { %>
        <table id="outServiceSparePartStatList">
          <thead>
            <tr><th>STT</th><th>Loại</th><th>Mã</th><th>Tên</th><th>SL</th><th>Doanh thu</th></tr>
          </thead>
          <tbody>
            <% int rowIndex = 1; for (ServiceSparePartStatistics3 row : rows) { %>
            <tr id="selectedStatItem-<%= row.getItemId() %>-<%= row.getItemType().getParameterValue() %>" class="clickable" onclick="location.href='ItemUsageListView3.jsp?itemId=<%= row.getItemId() %>&amp;itemType=<%= row.getItemType().getParameterValue() %>&amp;startDate=<%= start %>&amp;endDate=<%= end %>'">
              <td><%= rowIndex++ %></td>
              <td><%= row.getItemType().getDisplayName() %></td>
              <td><%= row.getItemCode() %></td>
              <td><%= row.getItemName() %></td>
              <td><%= row.getQuantity() %> <%= row.getUnit() %></td>
              <td><%= row.getRevenue() %> VNĐ</td>
            </tr>
            <% } %>
            <% if (rows.length == 0) { %>
            <tr><td colspan="6">Không có dữ liệu trong khoảng thời gian này.</td></tr>
            <% } %>
          </tbody>
        </table>
        <p class="small">Chọn một dòng để xem các hóa đơn sử dụng mục đó.</p>
        <% } %>
      </section>
    </main>
  </body>
</html>
