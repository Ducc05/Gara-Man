package model;
public class ScheduleConfig3 {
  private int id, dayOfWeek;
  public ScheduleConfig3() {}
  public ScheduleConfig3(int id, int day) {
    this.id = id;
    dayOfWeek = day;
  }
  public int getId() {
    return id;
  }
  public int getDayOfWeek() {
    return dayOfWeek;
  }
}
