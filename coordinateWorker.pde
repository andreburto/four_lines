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
      this.horizontalD = Direction.LEFT; 
    } else {
      this.horizontalD = Direction.RIGHT;
    }
    
    if (y < floor(spaceHeight / 2)) {
      this.verticalD = Direction.DOWN; 
    } else {
      this.verticalD = Direction.UP;
    }
    
    // set initial change anount
    this.changeAmount = 5;
  }
  
  protected void updateDirection() {
    // horizontal
    if (this.x <= 0) { this.horizontalD = Direction.RIGHT; }
    if (this.x >= this.spaceWidth) { this.horizontalD = Direction.LEFT; }
    // vertical
    if (this.y <= 0) { this.verticalD = Direction.DOWN; }
    if (this.y >= this.spaceHeight) { this.verticalD = Direction.UP; }
  }
  
  protected void updateHorizontalLocation() {
    if (this.horizontalD == Direction.RIGHT) { this.x = this.x + this.changeAmount; }
    else { this.x = this.x - this.changeAmount; }
  }
  
  protected void updateVerticalLocation() {
    if (this.verticalD == Direction.UP) { this.y = this.y - this.changeAmount; }
    else { this.y = this.y + this.changeAmount; }
  }
  
  public void updateLocation() {
    this.updateHorizontalLocation();
    this.updateVerticalLocation();
    this.updateDirection();
  }
  
  public void setChangeAmount(float newCA) {
    this.changeAmount = newCA;
  }
}
