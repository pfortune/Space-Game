public class Missile {
  // Declare instance variables
  private float x, y, w, h, speed;
  private color colour;
  private BoundingBox boundingBox;

  // Constructor for Missile class
  public Missile(float x, float y) {
    setX(x);
    setY(y);
    setWidth(5);
    setHeight(15);
    setSpeed(5);
    setColour(color(255, 0, 155));
    // Create a new BoundingBox for the missile
    this.boundingBox = new BoundingBox(getX(), getY(), getWidth(), getHeight());
  }

  // Update the missile's position and its BoundingBox
  public void update() {
    y -= speed;
    boundingBox.setX(getX());
    boundingBox.setY(getY());
  }

  // Display the missile on the screen
  public void display() {
    fill(colour);
    rect(getX() - (getWidth() / 2), getY() - (getHeight() / 2), getWidth(), getHeight());
  }

  /*********************/
  /* Getters & Setters */
  /*********************/

  public BoundingBox getBoundingBox() {
    return boundingBox;
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

  public void setWidth(float w) {
    this.w = w;
  }

  public float getWidth() {
    return this.w;
  }

  public void setHeight(float h) {
    this.h = h;
  }

  public float getHeight() {
    return this.h;
  }

  public void setSpeed(float speed) {
    this.speed = speed;
  }

  public float getSpeed() {
    return this.speed;
  }

  public void setColour(color colour) {
    this.colour = colour;
  }

  public color getColour() {
    return this.colour;
  }
}
