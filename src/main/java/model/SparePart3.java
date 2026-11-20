package model;
import java.math.BigDecimal;
public class SparePart3 {
  private int id;
  private String partCode, name, unit, description;
  private BigDecimal sellingPrice;
  private int stockQuantity;
  public SparePart3() {}
  public SparePart3(int id, String partCode, String name, String unit, BigDecimal sellingPrice,
      int stockQuantity, String description) {
    this.id = id;
    this.partCode = partCode;
    this.name = name;
    this.unit = unit;
    this.sellingPrice = sellingPrice;
    this.stockQuantity = stockQuantity;
    this.description = description;
  }
  public int getId() {
    return id;
  }
  public void setId(int v) {
    id = v;
  }
  public String getPartCode() {
    return partCode;
  }
  public void setPartCode(String v) {
    partCode = v;
  }
  public String getName() {
    return name;
  }
  public void setName(String v) {
    name = v;
  }
  public String getUnit() {
    return unit;
  }
  public void setUnit(String v) {
    unit = v;
  }
  public BigDecimal getSellingPrice() {
    return sellingPrice;
  }
  public void setSellingPrice(BigDecimal v) {
    sellingPrice = v;
  }
  public int getStockQuantity() {
    return stockQuantity;
  }
  public void setStockQuantity(int v) {
    stockQuantity = v;
  }
  public String getDescription() {
    return description;
  }
  public void setDescription(String v) {
    description = v;
  }
}
