class Enemy {

  private float x, y, speed;
  //private Missile[] missiles;
  private BoundingBox boundingBox;
  //private PuffBall[] puffs;

  public Enemy(float x, float y, float speed) {
    setX(x);
    setY(y);
    setSpeed(speed);
    boundingBox = new BoundingBox(getX() - 20, getY() - 40, 40, 40);
  }

  public void update(Ship ship) {
    float dx = ship.getX() - getX();
    float dy = ship.getY() - getY();
    float distance = sqrt(dx * dx + dy * dy);

    // Normalise the direction vector
    float directionX = dx / distance;
    float directionY = dy / distance;

    // Update the enemy's position
    x += directionX * speed;
    y += directionY * speed;

    // Update the enemy's bounding box
    boundingBox.setX(getX() - 20);
    boundingBox.setY(getY() - 40);
  }


  public void display() {
    // Main body (triangle)
    fill(200, 30, 30);
    triangle(getX(), getY(), getX() - 20, getY() - 40, getX() + 20, getY() - 40);

    // Cabin (rectangle)
    fill(100, 100, 100);
    rect(getX() - 5, getY() - 30, 10, 10);
  }

  public BoundingBox getBoundingBox() {
    return boundingBox;
  }

  public void setSpeed(float speed) {
    this.speed = speed;
  }

  public float getSpeed() {
    return this.speed;
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
}
