class trailLines {
  
  protected ArrayList<fourLines> lineList;
  protected int changeCounterMax = 500;
  protected int changeCounter = 0;
  protected boolean isFull = false;
  
  class randomColor {
    public int r; 
    public int g; 
    public int b;
    public randomColor() {
      this.r = floor(random(0, 255));
      this.g = floor(random(0, 255));
      this.b = floor(random(0, 255));
    }
  }
  
  public trailLines(float winWidth, float winHeight, int trailLength, int trailSpace) {
    lineList = new ArrayList<fourLines>();
    
    fourLines baseFourLines = new fourLines(winWidth, winHeight);
    baseFourLines.setMoveRate(trailSpace);
    baseFourLines.setChangeCount(-1);
        
    // Add the number of lines we want.
    for (int lc = 0; lc < trailLength - 1; lc++) {
      lineList.add(baseFourLines.copy());
      
      // Move each line ahead to create a trail.
      for (int innerlc = 0; innerlc < lineList.size(); innerlc++) {
        lineList.get(innerlc).actOnAllLines(LineAction.UPDATELINE);
      }
    }
  }
  
  protected void updateChangeCounter() {
    if (changeCounterMax < 0)
      return;
      
    changeCounter++;
    
    if (changeCounter == changeCounterMax) {
      changeCounter = 0;
      randomColor rc = new randomColor();

      for (int lc = 0; lc < lineList.size(); lc++) {
        lineList.get(lc).setStrokeColor(rc.r, rc.g, rc.b);
      }
    }
  }
  
  public void setChangeCount(int changeCount) {
    changeCounterMax = changeCount;
  }
  
  public void updateLines() {
    updateChangeCounter();
    
    for (int lc = 0; lc < lineList.size(); lc++) {
      lineList.get(lc).updateLines();
    }
  }
}
