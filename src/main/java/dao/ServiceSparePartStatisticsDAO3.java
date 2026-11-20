package dao;
import model.ItemType3;
import model.ServiceSparePartStatistics3;
import java.sql.*;
import java.time.LocalDate;
import java.util.*;
public class ServiceSparePartStatisticsDAO3 extends DAO3 {
  public ServiceSparePartStatistics3[] getServiceSparePartStatistics(
      LocalDate startDate, LocalDate endDate) throws SQLException {
    String q = "SELECT itemId,itemType,itemCode,itemName,unit,SUM(quantity) quantity,SUM(revenue) "
               + "revenue FROM ("
        + "SELECT s.id itemId,'Service' itemType,s.serviceCode itemCode,s.name itemName,s.unit "
          + "unit,us.quantity quantity,us.totalPrice revenue FROM tblUsedService3 us JOIN "
          + "tblService3 s ON s.id=us.serviceId JOIN tblRepairOrder3 ro ON ro.id=us.repairOrderId "
          + "JOIN tblInvoice3 i ON i.repairOrderId=ro.id WHERE i.createdAt>=? AND i.createdAt<? "
        + "UNION ALL SELECT "
          + "sp.id,'SparePart',sp.partCode,sp.name,sp.unit,up.quantity,up.totalPrice FROM "
          + "tblUsedSparePart3 up JOIN tblSparePart3 sp ON sp.id=up.sparePartId JOIN "
          + "tblRepairOrder3 ro ON ro.id=up.repairOrderId JOIN tblInvoice3 i ON "
          + "i.repairOrderId=ro.id WHERE i.createdAt>=? AND i.createdAt<?) u GROUP BY "
          + "itemId,itemType,itemCode,itemName,unit ORDER BY revenue DESC";
    List<ServiceSparePartStatistics3> a = new ArrayList<>();
    try (Connection c = getConnection(); PreparedStatement p = c.prepareStatement(q)) {
      Timestamp from = Timestamp.valueOf(startDate.atStartOfDay()),
                to = Timestamp.valueOf(endDate.plusDays(1).atStartOfDay());
      p.setTimestamp(1, from);
      p.setTimestamp(2, to);
      p.setTimestamp(3, from);
      p.setTimestamp(4, to);
      try (ResultSet r = p.executeQuery()) {
        while (r.next())
          a.add(new ServiceSparePartStatistics3(r.getInt("itemId"),
              ItemType3.fromParameter(r.getString("itemType")), r.getString("itemCode"),
              r.getString("itemName"), r.getString("unit"), r.getBigDecimal("quantity"),
              r.getBigDecimal("revenue")));
      }
    }
    return a.toArray(ServiceSparePartStatistics3[] ::new);
  }
}
