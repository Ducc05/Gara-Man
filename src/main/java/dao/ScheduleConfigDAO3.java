package dao;
import model.ScheduleConfig3;
import java.sql.*;
public class ScheduleConfigDAO3 extends DAO3 {
  public ScheduleConfig3 getScheduleConfig(int dayOfWeek) throws SQLException {
    try (Connection c = getConnection();
        PreparedStatement p = c.prepareStatement(
            "SELECT id,dayOfWeek FROM tblScheduleConfig3 WHERE dayOfWeek=? LIMIT 1")) {
      p.setInt(1, dayOfWeek);
      try (ResultSet r = p.executeQuery()) {
        return r.next() ? new ScheduleConfig3(r.getInt(1), r.getInt(2)) : null;
      }
    }
  }
}
