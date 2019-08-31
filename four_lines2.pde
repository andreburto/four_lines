public enum Direction { 
  UP, DOWN, LEFT, RIGHT 
}

public enum LineAction { 
  DRAWLINE, UPDATELINE, BOTH 
}

ArrayList<fourLines> fourLinesList;
fourLines fl;

void setup() {
  // Set lines up
  fl = new fourLines(width, height);
  
  fl.setChangeCount(-1);
  fl.setStrokeColor(255,100,100);
  // Set up the screen
  fullScreen();
  frameRate(30);
}

void draw() {
  background(#000000);
  fl.updateFourLines();
  
  // Save frames for demo movies
  // saveFrame("line-######.png");
}
