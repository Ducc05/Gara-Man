package model;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.*;
public class Invoice3 {
  private int id;
  private String invoiceCode, customerName, customerPhone, licensePlate, itemName;
  private String cashierName, technicianName;
  private ItemType3 itemType;
  private LocalDateTime createdAt, paidAt;
  private BigDecimal totalAmount;
  private List<InvoiceLine3> lines = new ArrayList<>();
  public int getId() {
    return id;
  }
  public void setId(int v) {
    id = v;
  }
  public String getInvoiceCode() {
    return invoiceCode;
  }
  public void setInvoiceCode(String v) {
    invoiceCode = v;
  }
  public String getCustomerName() {
    return customerName;
  }
  public void setCustomerName(String v) {
    customerName = v;
  }
  public String getCustomerPhone() {
    return customerPhone;
  }
  public void setCustomerPhone(String v) {
    customerPhone = v;
  }
  public String getLicensePlate() {
    return licensePlate;
  }
  public void setLicensePlate(String v) {
    licensePlate = v;
  }
  public String getCashierName() {
    return cashierName;
  }
  public void setCashierName(String v) {
    cashierName = v;
  }
  public String getTechnicianName() {
    return technicianName;
  }
  public void setTechnicianName(String v) {
    technicianName = v;
  }
  public String getItemName() {
    return itemName;
  }
  public void setItemName(String v) {
    itemName = v;
  }
  public ItemType3 getItemType() {
    return itemType;
  }
  public void setItemType(ItemType3 v) {
    itemType = v;
  }
  public LocalDateTime getCreatedAt() {
    return createdAt;
  }
  public void setCreatedAt(LocalDateTime v) {
    createdAt = v;
  }
  public LocalDateTime getPaidAt() {
    return paidAt;
  }
  public void setPaidAt(LocalDateTime v) {
    paidAt = v;
  }
  public BigDecimal getTotalAmount() {
    return totalAmount;
  }
  public void setTotalAmount(BigDecimal v) {
    totalAmount = v;
  }
  public List<InvoiceLine3> getLines() {
    return lines;
  }
  public void setLines(List<InvoiceLine3> v) {
    lines = v;
  }

  public static class InvoiceLine3 {
    private ItemType3 type;
    private String name, unit;
    private int quantity;
    private BigDecimal unitPrice, totalPrice;
    public InvoiceLine3(ItemType3 t, String n, String u, int q, BigDecimal p, BigDecimal total) {
      type = t;
      name = n;
      unit = u;
      quantity = q;
      unitPrice = p;
      totalPrice = total;
    }
    public ItemType3 getType() {
      return type;
    }
    public String getDisplayType() {
      return type.getDisplayName();
    }
    public String getName() {
      return name;
    }
    public String getUnit() {
      return unit;
    }
    public int getQuantity() {
      return quantity;
    }
    public BigDecimal getUnitPrice() {
      return unitPrice;
    }
    public BigDecimal getTotalPrice() {
      return totalPrice;
    }
  }
}
