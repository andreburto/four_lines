import java.lang.Cloneable;

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
  
  protected void setLineList(ArrayList<lineWorker> lineList) {
    this.lineList = lineList;
  }
  
  protected float makeRandom(float top, float bottom) {
    return floor(random(top, bottom));
  }
  
  protected void setStroke() {
    stroke(r, g, b);
    strokeWeight(strokeWidth);
    noFill();
  }
  
  protected void setStrokeColor() {
    r = int(random(0, 255));
    g = int(random(0, 255));
    b = int(random(0, 255));
  }
  
  public void setStrokeColor(int r, int g, int b) {
    this.r = r; this.g = g; this.b = b;
  }
  
  protected void updateChangeCounter() {
    if (changeCounterMax < 0)
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
    changeCounterMax = changeCount;
  }
  
  public void setMoveRate(float moveRate) {
    for (int lc = 0; lc < lineList.size(); lc++) {
      lineList.get(lc).setChangeAmount(moveRate);
    }
  }
  
  public float getMoveRate() {
    return lineList.get(0).getChangeAmount();
  }
  
  public void actOnAllLines(LineAction action) {
    for (int lc = 0; lc < lineList.size(); lc++) {
      switch (action) {
        case DRAWLINE:
          print("DRAWLINE ");
          lineList.get(lc).drawLine();
          break;
        case UPDATELINE:
          print("UPDATELINE ");
          lineList.get(lc).updateLine();
          break;
        default:
          print("BOTH ");
          lineList.get(lc).drawLine();
          lineList.get(lc).updateLine();
      }
    }
  }
  
  public void updateLines() {
    setStroke();
    actOnAllLines(LineAction.BOTH);
    updateChangeCounter();
  }
  
  public fourLines copy() 
  {
    fourLines copy = new fourLines(0, 0, strokeWidth);
    copy.setStrokeColor(r, g, b);
    copy.setChangeCount(changeCounter);
    
    // Copy the line list
    ArrayList<lineWorker> copyLineList = new ArrayList<lineWorker>();
    for (int lc = 0; lc < lineList.size(); lc++) {
      copyLineList.add(lineList.get(lc).copy());
    }
    copy.setLineList(copyLineList);
    
    return copy;
  }
}
