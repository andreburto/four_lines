public enum Direction { 
  UP, DOWN, LEFT, RIGHT
}

public enum LineAction { 
  DRAWLINE, UPDATELINE, BOTH 
}

ArrayList<fourLines> fourLinesList;
fourLines fl;
trailLines tl, tl2;

void setup() {
  // Set lines up
  fl = new fourLines(width, height);
  tl = new trailLines(width, height, 10, 10);
  
  // Set how soon the lines change
  fl.setChangeCount(100);
  tl.setChangeCount(100);
  
  // Set up the screen
  fullScreen();
  frameRate(30);
}

void draw() {
  background(#000000);
  
  fl.updateLines();
  tl.updateLines();
  
  // Save frames for demo movies
  //saveFrame("line-######.png");
}
