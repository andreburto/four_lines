class lineWorker {
  coordinateWorker cw1;
  coordinateWorker cw2;
  
  public lineWorker(coordinateWorker cw1, coordinateWorker cw2) {
    this.cw1 = cw1;
    this.cw2 = cw2;
  }
  
  public void drawLine() {
    line(cw1.x, cw1.y, cw2.x, cw2.y);
    cw1.updateLocation();
    cw2.updateLocation();
  }
  
  public void setChangeAmount(float newCA) {
    cw1.setChangeAmount(newCA);
    cw2.setChangeAmount(newCA);
  }
}
