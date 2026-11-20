package dao;
import model.Shift3;
import java.sql.*;
import java.util.*;
public class ShiftDAO3 extends DAO3 {
  public Shift3[] getListShift(int configId) throws SQLException {
    List<Shift3> a = new ArrayList<>();
    try (Connection c = getConnection();
        PreparedStatement p =
            c.prepareStatement("SELECT id,name,startTime,endTime,description FROM tblShift3 WHERE "
                               + "scheduleConfigId=? ORDER BY startTime")) {
      p.setInt(1, configId);
      try (ResultSet r = p.executeQuery()) {
        while (r.next())
          a.add(
              new Shift3(r.getInt("id"), r.getString("name"), r.getTime("startTime").toLocalTime(),
                  r.getTime("endTime").toLocalTime(), r.getString("description")));
      }
    }
    return a.toArray(Shift3[] ::new);
  }
}
