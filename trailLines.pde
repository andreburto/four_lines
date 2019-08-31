class trailLines {
  
  protected ArrayList<fourLines> lineList;
  protected int trailLength = 5;
  protected int trailSpace = 5;
  protected int trailSpaceCounter = 0;
  protected boolean isFull = false;
  
  public trailLines(float winWidth, float winHeight) {
    lineList = new ArrayList<fourLines>();
    lineList.add(new fourLines(winWidth, winHeight));
  }
  
  public void setTrailLength(int len) {
    trailLength = len;
  }
  
  public void setTrailSpace(int space) {
    trailSpace = space;
  }
  
  public void updateTrailLines() {
    for (int lc = 0; lc < lineList.size(); lc++) {
    }
  }
}
