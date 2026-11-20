package dao;
import model.Service3;
import java.sql.*;
import java.util.*;
public class ServiceDAO3 extends DAO3 {
  public Service3[] getListService() throws SQLException {
    String q =
        "SELECT id,serviceCode,name,unit,unitPrice,description FROM tblService3 ORDER BY name";
    List<Service3> a = new ArrayList<>();
    try (Connection c = getConnection(); PreparedStatement p = c.prepareStatement(q);
        ResultSet r = p.executeQuery()) {
      while (r.next())
        a.add(new Service3(r.getInt("id"), r.getString("serviceCode"), r.getString("name"),
            r.getString("unit"), r.getBigDecimal("unitPrice"), r.getString("description")));
    }
    return a.toArray(Service3[] ::new);
  }
}
