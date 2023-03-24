class Pickup {
  float x, y, size;
  private BoundingBox boundingBox;

  public Pickup(float x, float y) {
    setX(x);
    setY(y);
    setSize(20);
    // Create a new BoundingBox for the pickup
    this.boundingBox = new BoundingBox(getX()-size/2, getY()-size/2, size/2, size/2);
  }

  public void update() {
  }

  public void display() {
    // Outer circle (ellipse)
    fill(190, 190, 190);
    ellipse(getX(), getY(), getSize(), getSize());

    // Main body (rectangle)
    fill(255, 255, 255);
    rect(getX() - 2, getY() - 2, 4, 8);

    // Tip (triangle)
    fill(255, 0, 0);
    triangle(getX(), getY() - 8, getX() - 2, getY() - 2, getX() + 2, getY() - 2);
  }

  /*********************/
  /* Getters & Setters */
  /*********************/

  public void setX(float x) {
    this.x = x;
  }

  public void setY(float y) {
    this.y = y;
  }

  public void setSize(float size) {
    this.size = size;
  }

  public BoundingBox getBoundingBox() {
    return this.boundingBox;
  }

  public float getX() {
    return this.x;
  }

  public float getY() {
    return this.y;
  }

  public float getSize() {
    return this.size;
  }
}
