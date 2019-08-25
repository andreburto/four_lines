ArrayList<fourLines> fourLinesList;
int objectCountMax = 4;

void setup() {
  // Set lines up
  fourLinesList = new ArrayList<fourLines>();
  for (int oc = 0; oc < objectCountMax; oc++) {
    fourLinesList.add(new fourLines(width, height));
  }
  
  // Set up the screen
  fullScreen();
  background(#000000);
  frameRate(30);
}

void draw() {
  // Update all of the fourLines objects
  for (int flc = 0; flc < fourLinesList.size(); flc++) {
    fourLinesList.get(flc).updateFourLines();
  }
  
  // Save frames for demo movies
  saveFrame("line-######.png");
}
