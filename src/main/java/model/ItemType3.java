package model;

/** Stable Java type mapped to the module's Service/SparePart request values. */
public enum ItemType3 {
  SERVICE("Service", "Dịch vụ"),
  SPARE_PART("SparePart", "Phụ tùng");

  private final String parameterValue;
  private final String displayName;

  ItemType3(String parameterValue, String displayName) {
    this.parameterValue = parameterValue;
    this.displayName = displayName;
  }

  public String getParameterValue() {
    return parameterValue;
  }
  public String getDisplayName() {
    return displayName;
  }

  public static ItemType3 fromParameter(String value) {
    for (ItemType3 type : values()) {
      if (type.parameterValue.equals(value))
        return type;
    }
    throw new IllegalArgumentException("itemType không hợp lệ: " + value);
  }
}
