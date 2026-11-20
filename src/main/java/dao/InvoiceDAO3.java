package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Invoice3;
import model.ItemType3;

public class InvoiceDAO3 extends DAO3 {
  public Invoice3[] getInvoicesByItem(
      int itemId, String itemType, LocalDate startDate, LocalDate endDate) throws SQLException {
    ItemType3 type = ItemType3.fromParameter(itemType);
    String table = type == ItemType3.SERVICE ? "tblUsedService3" : "tblUsedSparePart3";
    String column = type == ItemType3.SERVICE ? "serviceId" : "sparePartId";
    String query = invoiceSelect()
        + "JOIN " + table + " u ON u.repairOrderId=ro.id WHERE u." + column
        + "=? AND i.createdAt>=? AND i.createdAt<? ORDER BY i.createdAt DESC";

    List<Invoice3> invoices = new ArrayList<>();
    try (Connection connection = getConnection();
         PreparedStatement statement = connection.prepareStatement(query)) {
      statement.setInt(1, itemId);
      statement.setTimestamp(2, Timestamp.valueOf(startDate.atStartOfDay()));
      statement.setTimestamp(3, Timestamp.valueOf(endDate.plusDays(1).atStartOfDay()));
      try (ResultSet result = statement.executeQuery()) {
        while (result.next()) {
          invoices.add(readInvoice(result));
        }
      }
    }
    return invoices.toArray(Invoice3[]::new);
  }

  public String getItemLabel(int itemId, String itemType) throws SQLException {
    ItemType3 type = ItemType3.fromParameter(itemType);
    String table = type == ItemType3.SERVICE ? "tblService3" : "tblSparePart3";
    String codeColumn = type == ItemType3.SERVICE ? "serviceCode" : "partCode";
    String query = "SELECT " + codeColumn + " AS itemCode, name FROM " + table + " WHERE id=?";
    try (Connection connection = getConnection();
         PreparedStatement statement = connection.prepareStatement(query)) {
      statement.setInt(1, itemId);
      try (ResultSet result = statement.executeQuery()) {
        if (result.next()) {
          return result.getString("itemCode") + " — " + result.getString("name");
        }
      }
    }
    return "Không xác định";
  }

  public Invoice3 getInvoiceDetail(int id) throws SQLException {
    String query = invoiceSelect() + "WHERE i.id=?";
    try (Connection connection = getConnection();
         PreparedStatement statement = connection.prepareStatement(query)) {
      statement.setInt(1, id);
      try (ResultSet result = statement.executeQuery()) {
        if (!result.next()) {
          return null;
        }

        Invoice3 invoice = readInvoice(result);
        List<Invoice3.InvoiceLine3> lines = new ArrayList<>();
        String detailQuery =
            "SELECT 'Service' AS type,s.name,s.unit,u.quantity,u.unitPrice,u.totalPrice "
                + "FROM tblUsedService3 u JOIN tblService3 s ON s.id=u.serviceId "
                + "WHERE u.repairOrderId=? UNION ALL "
                + "SELECT 'SparePart',s.name,s.unit,u.quantity,u.unitPrice,u.totalPrice "
                + "FROM tblUsedSparePart3 u JOIN tblSparePart3 s ON s.id=u.sparePartId "
                + "WHERE u.repairOrderId=?";
        try (PreparedStatement detail = connection.prepareStatement(detailQuery)) {
          detail.setInt(1, result.getInt("repairOrderId"));
          detail.setInt(2, result.getInt("repairOrderId"));
          try (ResultSet row = detail.executeQuery()) {
            while (row.next()) {
              lines.add(new Invoice3.InvoiceLine3(
                  ItemType3.fromParameter(row.getString("type")),
                  row.getString("name"),
                  row.getString("unit"),
                  row.getInt("quantity"),
                  row.getBigDecimal("unitPrice"),
                  row.getBigDecimal("totalPrice")));
            }
          }
        }
        invoice.setLines(lines);
        return invoice;
      }
    }
  }

  private String invoiceSelect() {
    return "SELECT i.id,i.invoiceCode,i.createdAt,i.paidAt,i.totalAmount,i.repairOrderId,"
        + "COALESCE(a.customerName,CONCAT_WS(' ',customerFullName.firstName,"
        + "NULLIF(customerFullName.middleName,''),customerFullName.lastName),'Khách vãng lai') AS customerName,"
        + "COALESCE(NULLIF(a.customerPhone,''),c.phone,'') AS customerPhone,"
        + "COALESCE(a.licensePlate,car.licensePlate,'') AS licensePlate,"
        + "CONCAT_WS(' ',cashierName.firstName,NULLIF(cashierName.middleName,''),"
        + "cashierName.lastName) AS cashierName,"
        + "CONCAT_WS(' ',technicianName.firstName,NULLIF(technicianName.middleName,''),"
        + "technicianName.lastName) AS technicianName "
        + "FROM tblInvoice3 i "
        + "JOIN tblRepairOrder3 ro ON ro.id=i.repairOrderId "
        + "JOIN tblReceptionNote3 rn ON rn.id=ro.tblReceptionNote3id "
        + "LEFT JOIN tblAppointment3 a ON a.id=rn.tblAppointment3id "
        + "LEFT JOIN tblCustomerCar3 cc ON cc.id=rn.customerCarId "
        + "LEFT JOIN tblCustomer3 c ON c.id=cc.customerId "
        + "LEFT JOIN tblFullName3 customerFullName ON customerFullName.id=c.fullNameId "
        + "LEFT JOIN tblCar3 car ON car.id=cc.carId "
        + "LEFT JOIN tblEmployee3 cashier ON cashier.id=i.cashierId "
        + "LEFT JOIN tblFullName3 cashierName ON cashierName.id=cashier.fullNameId "
        + "LEFT JOIN tblEmployee3 technician ON technician.id=ro.technicianId "
        + "LEFT JOIN tblFullName3 technicianName ON technicianName.id=technician.fullNameId ";
  }

  private Invoice3 readInvoice(ResultSet result) throws SQLException {
    Invoice3 invoice = new Invoice3();
    invoice.setId(result.getInt("id"));
    invoice.setInvoiceCode(result.getString("invoiceCode"));
    invoice.setCreatedAt(result.getTimestamp("createdAt").toLocalDateTime());
    invoice.setPaidAt(result.getTimestamp("paidAt").toLocalDateTime());
    invoice.setTotalAmount(result.getBigDecimal("totalAmount"));
    invoice.setCustomerName(result.getString("customerName"));
    invoice.setCustomerPhone(result.getString("customerPhone"));
    invoice.setLicensePlate(result.getString("licensePlate"));
    invoice.setCashierName(result.getString("cashierName"));
    invoice.setTechnicianName(result.getString("technicianName"));
    return invoice;
  }
}
