class coordinate {
  float x;
  float y;
  
  public coordinate(float x, float y) {
    this.x = x; 
    this.y = y;
  }
}

class coordinateWorker extends coordinate {
  protected float spaceWidth; 
  protected float spaceHeight;
  protected float changeAmount;
  protected Direction horizontalD;
  protected Direction verticalD;
  
  public coordinateWorker(float x, float y, float spaceWidth, float spaceHeight) {
    super(x, y);
    
    this.spaceWidth = spaceWidth;
    this.spaceHeight = spaceHeight;
    
    // setup initial directions
    if (x < floor(spaceWidth / 2)) {
      horizontalD = Direction.LEFT; 
    } else {
      horizontalD = Direction.RIGHT;
    }
    
    if (y < floor(spaceHeight / 2)) {
      verticalD = Direction.DOWN; 
    } else {
      verticalD = Direction.UP;
    }
    
    // set initial change anount
    changeAmount = 5;
  }
  
  protected void updateDirection() {
    // horizontal
    if (x <= 0) { horizontalD = Direction.RIGHT; }
    if (x >= spaceWidth) { horizontalD = Direction.LEFT; }
    // vertical
    if (y <= 0) { verticalD = Direction.DOWN; }
    if (y >= spaceHeight) { verticalD = Direction.UP; }
  }
  
  protected void updateHorizontalLocation() {
    if (horizontalD == Direction.RIGHT) { x = x + changeAmount; }
    else { x = x - changeAmount; }
  }
  
  protected void updateVerticalLocation() {
    if (verticalD == Direction.UP) { y = y - changeAmount; }
    else { y = y + changeAmount; }
  }
  
  public void updateLocation() {
    updateHorizontalLocation();
    updateVerticalLocation();
    updateDirection();
  }
  
  public void setChangeAmount(float newCA) {
    changeAmount = newCA;
  }
  
  public float getChangeAmount() {
    return changeAmount;
  }
  
  public coordinateWorker copy() {
    coordinateWorker copy = new coordinateWorker(x, y, spaceWidth, spaceHeight);
    copy.setChangeAmount(changeAmount);
    return copy;
  }
}
