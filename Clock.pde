class Clock {
  
  DateTimeFormatter dtf;
  LocalDateTime now;
  
  Clock (DateTimeFormatter tempDtf, LocalDateTime tempNow) {
    dtf = tempDtf;
    now = tempNow;
  }
  
  void display() {
    push();
    line(0, 40, 150, 40);
    line(150, 0, 150, 40);
    fill(255);
    textAlign(LEFT);
    textSize(14);
    text(dtf.format(now), 20, 25);
    pop();
  }
  
}
