package model;
public class Employee3 {
  private String username, password;
  private EmployeeRole3 role;
  public Employee3() {}
  public Employee3(String username, String password) {
    this.username = username;
    this.password = password;
  }
  public String getUsername() {
    return username;
  }
  public void setUsername(String value) {
    username = value;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String value) {
    password = value;
  }
  public EmployeeRole3 getRole() {
    return role;
  }
  public void setRole(EmployeeRole3 value) {
    role = value;
  }
}
