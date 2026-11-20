package model;
public class Manager3 {
  private int id;
  private String username, fullName;
  public Manager3() {}
  public Manager3(int id, String username, String fullName) {
    this.id = id;
    this.username = username;
    this.fullName = fullName;
  }
  public int getId() {
    return id;
  }
  public void setId(int v) {
    id = v;
  }
  public String getUsername() {
    return username;
  }
  public void setUsername(String v) {
    username = v;
  }
  public String getFullName() {
    return fullName;
  }
  public void setFullName(String v) {
    fullName = v;
  }
}
