package dao;
import java.sql.*;
public class AppointmentDAO3 extends DAO3 {
  public int createAppointment(java.sql.Date date, String problem, String customerName,
      String phone, String email, String address, String plate, String brand, String model,
      int year, int shiftId, int[] serviceIds) throws SQLException {
    String q = "INSERT INTO "
               + "tblAppointment3(appointmentDate,problemDescription,customerName,customerPhone,"
               + "customerEmail,customerAddress,licensePlate,carBrand,carModel,manufactureYear,"
               + "status,shiftId) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
    try (Connection c = getConnection()) {
      c.setAutoCommit(false);
      try {
        int id;
        try (PreparedStatement p = c.prepareStatement(q, Statement.RETURN_GENERATED_KEYS)) {
          p.setDate(1, date);
          p.setString(2, problem);
          p.setString(3, customerName);
          p.setString(4, phone);
          p.setString(5, email);
          p.setString(6, address);
          p.setString(7, plate);
          p.setString(8, brand);
          p.setString(9, model);
          p.setInt(10, year);
          p.setString(11, "Chờ xác nhận");
          p.setInt(12, shiftId);
          p.executeUpdate();
          try (ResultSet k = p.getGeneratedKeys()) {
            if (!k.next())
              throw new SQLException("Không lấy được id lịch hẹn");
            id = k.getInt(1);
          }
        }
        try (PreparedStatement p = c.prepareStatement(
                 "INSERT INTO tblAppointmentService3(appointmentId,serviceId) VALUES(?,?)")) {
          for (int serviceId : serviceIds) {
            p.setInt(1, id);
            p.setInt(2, serviceId);
            p.addBatch();
          }
          if (serviceIds.length > 0)
            p.executeBatch();
        }
        c.commit();
        return id;
      } catch (SQLException e) {
        c.rollback();
        throw e;
      } finally {
        c.setAutoCommit(true);
      }
    }
  }
}
