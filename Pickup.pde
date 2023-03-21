class Pickup {
  float x, y, size;
  private BoundingBox boundingBox;

  public Pickup(float x, float y) {
    setX(x);
    setY(y);
    setSize(1);
    // Create a new BoundingBox for the pickup
    this.boundingBox = new BoundingBox(getX(), getY(), 20, 20);
  }
  
  public void update(){
    
  }

  public void display() {
    // Outer circle (ellipse)
    fill(190, 190, 190);
    ellipse(getX(), getY(), 20 * getSize(), 20 * getSize());

    // Main body (rectangle)
    fill(255, 255, 255);
    rect(getX() - 2 * getSize(), getY() - 2 * getSize(), 4 * getSize(), 8 * getSize());

    // Tip (triangle)
    fill(255, 0, 0);
    triangle(getX(), getY() - 8 * getSize(), getX() - 2 * getSize(), getY() - 2 * getSize(), getX() + 2 * getSize(), getY() - 2 * getSize());
  }

  public BoundingBox getBoundingBox() {
    return this.boundingBox;
  }

  public void setX(float x) {
    this.x = x;
  }

  public float getX() {
    return this.x;
  }

  public void setY(float y) {
    this.y = y;
  }

  public float getY() {
    return this.y;
  }

  public void setSize(float size) {
    this.size = size;
  }

  public float getSize() {
    return this.size;
  }
}
