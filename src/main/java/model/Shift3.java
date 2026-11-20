package model;
import java.time.LocalTime;
public class Shift3 {
  private int id;
  private String name, description;
  private LocalTime startTime, endTime;
  public Shift3() {}
  public Shift3(int id, String name, LocalTime start, LocalTime end, String desc) {
    this.id = id;
    this.name = name;
    startTime = start;
    endTime = end;
    description = desc;
  }
  public int getId() {
    return id;
  }
  public String getName() {
    return name;
  }
  public LocalTime getStartTime() {
    return startTime;
  }
  public LocalTime getEndTime() {
    return endTime;
  }
  public String getDescription() {
    return description;
  }
}
