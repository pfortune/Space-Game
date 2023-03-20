class Enemy {
    
  private float x, y, size;

  public Enemy(float x, float y, float size) {
    setX(x);
    setY(y);
    setSize(size);
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

  public void update() {
  }

  public void display() {
    // Main body (triangle)
    fill(200, 30, 30);
    triangle(getX(), getY(), getX() - 20 * getSize(), getY() - 40 * getSize(), getX() + 20 * getSize(), getY() - 40 * getSize());

    // Cabin (rectangle)
    fill(100, 100, 100);
    rect(getX() - 5 * getSize(), getY() - 30 * getSize(), 10 * getSize(), 10 * getSize());
  }


}
