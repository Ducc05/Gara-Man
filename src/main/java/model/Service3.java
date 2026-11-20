package model;
import java.math.BigDecimal;
public class Service3 {
  private int id;
  private String serviceCode, name, unit, description;
  private BigDecimal unitPrice;
  public Service3() {}
  public Service3(int id, String serviceCode, String name, String unit, BigDecimal unitPrice,
      String description) {
    this.id = id;
    this.serviceCode = serviceCode;
    this.name = name;
    this.unit = unit;
    this.unitPrice = unitPrice;
    this.description = description;
  }
  public int getId() {
    return id;
  }
  public void setId(int v) {
    id = v;
  }
  public String getServiceCode() {
    return serviceCode;
  }
  public void setServiceCode(String v) {
    serviceCode = v;
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
  public BigDecimal getUnitPrice() {
    return unitPrice;
  }
  public void setUnitPrice(BigDecimal v) {
    unitPrice = v;
  }
  public String getDescription() {
    return description;
  }
  public void setDescription(String v) {
    description = v;
  }
}
