int lineCount = 4;
ArrayList<lineWorker> lineList;
int changeCounterMax = 500;
int changeCounter = 0;

float makeRandom(float top, float bottom) {
  return floor(random(top, bottom));
}

void setStrokeColor() {
  int r = int(random(0, 255));
  int g = int(random(0, 255));
  int b = int(random(0, 255));
  stroke(r, g, b);
}

void setup() {
  // Set up the screen
  fullScreen();
  background(#000000);
  setStrokeColor();
  strokeWeight(1);
  noFill();
  frameRate(30);
  
  // Setup variable space size
  float winWidth = width;
  float winHeight = height;
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
}

void draw() {
  for (int lc = 0; lc < lineList.size(); lc++) {
    lineList.get(lc).drawLine();
  }
  
  changeCounter++;
  
  if (changeCounter == changeCounterMax) {
    changeCounter = 0;
    setStrokeColor();
    
    float newCA = floor(random(1, 10));
    for (int lc = 0; lc < lineList.size(); lc++) {
      lineList.get(lc).setChangeAmount(newCA);
    }
  }
}
