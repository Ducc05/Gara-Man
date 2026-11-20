package dao;
import model.*;
import java.sql.*;
public class EmployeeDAO3 extends DAO3 {
  public Manager3 checkLogin(Employee3 employee) throws SQLException {
    String q =
        "SELECT e.id,e.username,CONCAT_WS(' ',f.firstName,NULLIF(f.middleName,''),f.lastName) "
        + "fullName FROM tblEmployee3 e LEFT JOIN tblFullName3 f ON f.id=e.fullNameId WHERE "
        + "e.username=? AND e.password=? AND e.role=?";
    try (Connection c = getConnection(); PreparedStatement p = c.prepareStatement(q)) {
      p.setString(1, employee.getUsername());
      p.setString(2, employee.getPassword());
      p.setString(3, EmployeeRole3.MANAGER.name());
      try (ResultSet r = p.executeQuery()) {
        return r.next()
            ? new Manager3(r.getInt("id"), r.getString("username"), r.getString("fullName"))
            : null;
      }
    }
  }
}
