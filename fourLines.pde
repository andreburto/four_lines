class fourLines {
  
  protected ArrayList<lineWorker> lineList;
  protected int changeCounterMax = 500;
  protected int changeCounter = 0;
  protected int strokeWidth;
  
  // stroke colors
  int r; int g; int b;

  public fourLines(float winWidth, float winHeight) {
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
  
  protected float makeRandom(float top, float bottom) {
    return floor(random(top, bottom));
  }
  
  protected void setStrokeColor() {
    r = int(random(0, 255));
    g = int(random(0, 255));
    b = int(random(0, 255));
  }
  
  public void updateFourLines() {
    stroke(r, g, b);
    strokeWeight(strokeWidth);
    noFill();
    
    for (int lc = 0; lc < lineList.size(); lc++) {
      lineList.get(lc).drawLine();
    }
    
    changeCounter++;
    
    if (changeCounter == changeCounterMax) {
      changeCounter = 0;
      setStrokeColor();
      
      float newCA = floor(random(1, 20));
      for (int lc = 0; lc < lineList.size(); lc++) {
        lineList.get(lc).setChangeAmount(newCA);
      }
    } 
  }
}
