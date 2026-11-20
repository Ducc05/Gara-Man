<%@ page import="dao.ServiceDAO3, model.Service3" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%
Service3[] services = (Service3[]) request.getAttribute("services");
if (services == null) {
  try {
    services = new ServiceDAO3().getListService();
  } catch (Exception e) {
    request.setAttribute("loadError", "Không tải được danh sách dịch vụ. Kiểm tra kết nối cơ sở dữ liệu.");
  }
}
String problem = request.getParameter("problemDescription");
String[] selected = request.getParameterValues("serviceIds");
String error = (String) request.getAttribute("validationError");
pageContext.setAttribute("problem", problem);
%>
<!doctype html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <title>Mô tả tình trạng xe | Gara Man</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css" />
  </head>
  <body>
    <%@ include file="../common/header.jspf" %>
    <main>
      <section class="card">
        <h1>Thông tin dịch vụ</h1>
        <p class="sub">Chọn dịch vụ dự kiến hoặc mô tả tình trạng xe.</p>
        <% if (error != null) { %>
        <div class="error"><%= error %></div>
        <% } %>
        <% if (request.getAttribute("loadError") != null) { %>
        <div class="error"><%= request.getAttribute("loadError") %></div>
        <% } %>
        <form method="post" action="AppointmentScheduleView3.jsp">
          <label for="txtProblemDescription">Mô tả vấn đề</label>
          <textarea id="txtProblemDescription" name="problemDescription">${fn:escapeXml(problem)}</textarea>
          <fieldset id="tblService">
            <legend>Dịch vụ cần làm (có thể chọn nhiều)</legend>
            <div id="lnkSelectService">
            <div id="listService">
            <% if (services != null) { %>
            <% int serviceIndex = 1; for (Service3 service : services) {
              boolean checked = false;
              if (selected != null) {
                for (String serviceId : selected) {
                  if (serviceId.equals(String.valueOf(service.getId()))) checked = true;
                }
              }
            %>
            <label>
              <input id="selectedServices-<%= service.getId() %>" style="width: auto" type="checkbox" name="serviceIds" value="<%= service.getId() %>" <%= checked ? "checked" : "" %> />
              <%= serviceIndex++ %>. <%= service.getName() %>
            </label>
            <% } %>
            <% } %>
            </div>
            </div>
          </fieldset>
          <div class="actions">
            <button id="btnContinue" class="btn" type="submit">Tiếp tục</button>
          </div>
        </form>
      </section>
    </main>
    <script>
      document.querySelector("form").addEventListener("submit", (event) => {
        const hasDescription = document.querySelector("textarea").value.trim();
        const hasService = document.querySelector("input[name=serviceIds]:checked");
        if (!hasDescription && !hasService) {
          event.preventDefault();
          let message = document.querySelector(".error");
          if (!message) {
            message = document.createElement("div");
            message.className = "error";
            document.querySelector("form").prepend(message);
          }
          message.textContent = "Vui lòng mô tả sự cố hoặc chọn ít nhất một dịch vụ.";
        }
      });
    </script>
  </body>
</html>
