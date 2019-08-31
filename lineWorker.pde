class lineWorker {
  protected coordinateWorker cw1;
  protected coordinateWorker cw2;
  
  public lineWorker(coordinateWorker cw1, coordinateWorker cw2) {
    this.cw1 = cw1;
    this.cw2 = cw2;
  }
  
  public void drawLine() {
    line(cw1.x, cw1.y, cw2.x, cw2.y);
    println("draw");
  }
  
  public void updateLine() {
    cw1.updateLocation();
    cw2.updateLocation();
    println("update:", cw1.x, cw1.y, cw2.x, cw2.y);
  }
  
  public void setChangeAmount(float newCA) {
    cw1.setChangeAmount(newCA);
    cw2.setChangeAmount(newCA);
  }
  
  public float getChangeAmount() {
    return cw1.getChangeAmount();
  }
  
  public lineWorker copy() {
    return new lineWorker(cw1.copy(), cw2.copy());
  }
}
