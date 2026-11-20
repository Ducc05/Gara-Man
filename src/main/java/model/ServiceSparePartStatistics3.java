package model;
import java.math.BigDecimal;
public class ServiceSparePartStatistics3 {
  private int itemId;
  private ItemType3 itemType;
  private String itemCode, itemName, unit;
  private BigDecimal quantity, revenue;

  public ServiceSparePartStatistics3(int id, ItemType3 type, String code, String name, String unit,
      BigDecimal qty, BigDecimal revenue) {
    itemId = id;
    itemType = type;
    itemCode = code;
    itemName = name;
    this.unit = unit;
    quantity = qty;
    this.revenue = revenue;
  }
  public int getItemId() {
    return itemId;
  }
  public ItemType3 getItemType() {
    return itemType;
  }
  public String getItemCode() {
    return itemCode;
  }
  public String getItemName() {
    return itemName;
  }
  public String getUnit() {
    return unit;
  }
  public BigDecimal getQuantity() {
    return quantity;
  }
  public BigDecimal getRevenue() {
    return revenue;
  }
}
