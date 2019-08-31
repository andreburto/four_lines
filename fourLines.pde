class fourLines {
  
  protected ArrayList<lineWorker> lineList;
  protected int changeCounterMax = 500;
  protected int changeCounter = 0;
  protected int strokeWidth;
  
  // stroke colors
  int r; int g; int b;
  
  public fourLines(float winWidth, float winHeight) {
    strokeWidth = 1;
    
    float centerX = floor(winWidth / 2);
    float centerY = floor(winHeight / 2);
    
    // Top-left
    coordinateWorker c1 = new coordinateWorker(makeRandom(0, centerX), makeRandom(0, centerY),  winWidth, winHeight);
    // Bottom-left
    coordinateWorker c2 = new coordinateWorker(makeRandom(0, centerX), makeRandom(centerY, winHeight), winWidth, winHeight);
    // Top-right
    coordinateWorker c3 = new coordinateWorker(makeRandom(centerX, winWidth), makeRandom(0, centerY), winWidth, winHeight);
    // Bottom-right
    coordinateWorker c4 = new coordinateWorker(makeRandom(centerX, winWidth), makeRandom(centerY, winHeight), winWidth, winHeight);
    
    // Four lines connected together
    lineList = new ArrayList<lineWorker>();
    lineList.add(new lineWorker(c1, c2));
    lineList.add(new lineWorker(c2, c3));
    lineList.add(new lineWorker(c3, c4));
    lineList.add(new lineWorker(c4, c1));
    
    // Initialize this objects line colors
    setStrokeColor();
  }
  
  public fourLines(float winWidth, float winHeight, int strokeWidth) {
     this(winWidth, winHeight);
     this.strokeWidth = strokeWidth;
  }
  
  protected float makeRandom(float top, float bottom) {
    return floor(random(top, bottom));
  }
  
  protected void setStrokeColor() {
    r = int(random(0, 255));
    g = int(random(0, 255));
    b = int(random(0, 255));
  }
  
  public void setStrokeColor(int r, int g, int b) {
    this.r =r; this.g = g; this.b = b;
  }
  
  protected void updateChangeCounter() {
    if (changeCounter < 0)
      return;
      
    changeCounter++;
    
    if (changeCounter == changeCounterMax) {
      changeCounter = 0;
      setStrokeColor();
      
      float newCA = makeRandom(1, 20);
      for (int lc = 0; lc < lineList.size(); lc++) {
        lineList.get(lc).setChangeAmount(newCA);
      }
    }
  }
  
  public void setChangeCount(int changeCount) {
    changeCounter = changeCount;
  }
  
  public void actOnAllLines(LineAction action) {
    for (int lc = 0; lc < lineList.size(); lc++) {
      switch (action) {
        case DRAWLINE:
          lineList.get(lc).drawLine();
          break;
        case UPDATELINE:
          lineList.get(lc).updateLine();
          break;
        default:
          lineList.get(lc).updateLine();
          lineList.get(lc).drawLine();
      }
    }
  }
  
  public void updateFourLines() {
    stroke(r, g, b);
    strokeWeight(strokeWidth);
    noFill();
    
    actOnAllLines(LineAction.BOTH);
    
    updateChangeCounter();
  }
}
