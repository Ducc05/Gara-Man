package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/** Shared JDBC connection settings. Override with -Dgaraman.db.user/password if needed. */
public class DAO3 {
  protected static final String URL = System.getProperty("garaman.db.url",
      "jdbc:mysql://localhost:3306/"
      + "garaman?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Ho_Chi_Minh");
  protected static final String USER = System.getProperty("garaman.db.user", "garaman_demo_app");
  protected static final String PASSWORD = System.getProperty("garaman.db.password", "garaman_demo_pw");
  static {
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
      throw new ExceptionInInitializerError(e);
    }
  }
  protected Connection getConnection() throws SQLException {
    return DriverManager.getConnection(URL, USER, PASSWORD);
  }
}
