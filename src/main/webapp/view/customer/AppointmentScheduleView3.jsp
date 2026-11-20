<%@ page import="dao.ScheduleConfigDAO3, dao.ShiftDAO3, model.ScheduleConfig3, model.Shift3, java.time.LocalDate, java.time.format.DateTimeFormatter" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%
String action = request.getParameter("action");
String date = request.getParameter("appointmentDate");
String problem = request.getParameter("problemDescription");
String[] serviceIds = request.getParameterValues("serviceIds");
String selectedShiftId = request.getParameter("selectedShiftId");
String displayDate = date;
try {
  if (date != null && !date.isBlank()) {
    displayDate = LocalDate.parse(date).format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
  }
} catch (Exception ignored) {
  // Invalid dates are handled by the date check below.
}
String error = null;
Shift3[] shifts = null;
ScheduleConfig3 scheduleConfig = null;
pageContext.setAttribute("problem", problem);

if ("POST".equalsIgnoreCase(request.getMethod()) && action == null
    && (problem == null || problem.isBlank()) && (serviceIds == null || serviceIds.length == 0)) {
  request.setAttribute("validationError", "Vui lòng mô tả vấn đề hoặc chọn ít nhất một dịch vụ.");
  try {
    request.setAttribute("services", new dao.ServiceDAO3().getListService());
  } catch (Exception ignored) {
    // The destination page displays the database connection message.
  }
  request.getRequestDispatcher("ServiceProblemView3.jsp").forward(request, response);
  return;
}

if ("checkDate".equals(action) && date != null && !date.isBlank()) {
  try {
    LocalDate selectedDate = LocalDate.parse(date);
    if (selectedDate.isBefore(LocalDate.now())) {
      error = "Không thể chọn ngày trong quá khứ.";
    } else {
      scheduleConfig = new ScheduleConfigDAO3().getScheduleConfig(selectedDate.getDayOfWeek().getValue());
      if (scheduleConfig == null) {
        error = "Gara nghỉ làm việc vào Chủ nhật.";
      } else {
        shifts = new ShiftDAO3().getListShift(scheduleConfig.getId());
      }
    }
  } catch (Exception ex) {
    error = "Không thể tải ca làm việc. Kiểm tra kết nối cơ sở dữ liệu.";
  }
}

if ("chooseShift".equals(action)) {
  request.setAttribute("appointmentDate", date);
  request.setAttribute("problemDescription", problem);
  request.setAttribute("serviceIds", serviceIds);
  request.setAttribute("shiftId", request.getParameter("shiftId"));
  request.getRequestDispatcher("CustomerCarInfoView3.jsp").forward(request, response);
  return;
}
%>
<!doctype html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <title>Chọn ngày hẹn | Gara Man</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css" />
    <script src="${pageContext.request.contextPath}/js/date-input.js" defer></script>
  </head>
  <body>
    <%@ include file="../common/header.jspf" %>
    <main>
      <section class="card">
        <h1>Chọn ngày và ca hẹn</h1>
        <p class="sub">Gara làm việc từ Thứ 2 đến Thứ 7.</p>
        <% if (error != null) { %>
        <div class="error"><%= error %></div>
        <% } %>
        <form method="post">
          <input type="hidden" name="action" value="checkDate" />
          <input type="hidden" name="problemDescription" value="${fn:escapeXml(problem)}" />
          <% if (serviceIds != null) { %>
          <% for (String serviceId : serviceIds) { %>
          <input type="hidden" name="serviceIds" value="<%= serviceId %>" />
          <% } %>
          <% } %>
          <input type="hidden" name="selectedShiftId" value="<%= selectedShiftId == null ? "" : selectedShiftId %>" />
          <label for="txtAppointmentDate">Ngày hẹn</label>
          <div class="date-input">
            <input id="txtAppointmentDate" data-date-text type="text" inputmode="numeric" autocomplete="off" placeholder="dd/MM/yyyy" pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}" title="Nhập ngày theo dạng dd/MM/yyyy" required value="<%= displayDate == null ? "" : displayDate %>" />
            <button class="btn secondary date-picker-button" type="button" data-date-button="appointmentDatePicker" aria-label="Mở lịch" title="Chọn ngày">
                  <svg viewBox="0 0 24 24" aria-hidden="true" focusable="false">
                    <rect x="3.5" y="5" width="17" height="15.5" rx="2" />
                    <path d="M7.5 3.5v3M16.5 3.5v3M3.5 9h17M7.5 12.5h.01M12 12.5h.01M16.5 12.5h.01M7.5 16h.01M12 16h.01" />
                  </svg>
                </button>
            <input id="appointmentDatePicker" class="date-picker-native" data-date-picker type="date" aria-label="Chọn ngày hẹn" min="<%= LocalDate.now() %>" value="<%= date == null ? "" : date %>" />
            <input id="appointmentDate" data-date-iso type="hidden" name="appointmentDate" value="<%= date == null ? "" : date %>" />
          </div>
          <button id="btnCheckSchedule" class="btn" style="margin-top: 14px" type="submit">Kiểm tra ca</button>
        </form>
        <% if (shifts != null) { %>
        <form method="post" action="AppointmentScheduleView3.jsp">
          <input type="hidden" name="action" value="chooseShift" />
          <input type="hidden" name="appointmentDate" value="<%= date %>" />
          <input type="hidden" name="problemDescription" value="${fn:escapeXml(problem)}" />
          <% if (serviceIds != null) { %>
          <% for (String serviceId : serviceIds) { %>
          <input type="hidden" name="serviceIds" value="<%= serviceId %>" />
          <% } %>
          <% } %>
          <fieldset id="tblShift">
            <legend>Ca làm việc</legend>
            <div id="lnkSelectShift">
            <% int shiftIndex = 1; for (Shift3 shift : shifts) { %>
            <label for="selectedShift-<%= shift.getId() %>">
              <input id="selectedShift-<%= shift.getId() %>" style="width: auto" required type="radio" name="shiftId" value="<%= shift.getId() %>" <%= String.valueOf(shift.getId()).equals(selectedShiftId) ? "checked" : "" %> />
              <%= shiftIndex++ %>. <%= shift.getName() %> (<%= shift.getStartTime() %>–<%= shift.getEndTime() %>)
            </label>
            <% } %>
            </div>
          </fieldset>
          <button id="btnContinue" class="btn" type="submit">Tiếp tục</button>
        </form>
        <% } %>
        <div class="actions">
          <form method="post" action="ServiceProblemView3.jsp">
            <input type="hidden" name="problemDescription" value="${fn:escapeXml(problem)}" />
            <% if (serviceIds != null) { %>
            <% for (String serviceId : serviceIds) { %>
            <input type="hidden" name="serviceIds" value="<%= serviceId %>" />
            <% } %>
            <% } %>
            <button id="btnBack" class="btn secondary" type="submit">Quay lại</button>
          </form>
        </div>
      </section>
    </main>
  </body>
</html>
