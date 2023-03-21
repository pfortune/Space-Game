public class Missile {
  // Declare instance variables
  private float x, y, w, h, speed, payload;
  private color colour;
  private BoundingBox boundingBox;
  private PuffBall explosion;

  // Constructor for Missile class
  public Missile(float x, float y) {
    this();
    setX(x);
    setY(y);
  }

  public Missile() {
    setPayload(50);
    setWidth(payload/10);
    setHeight(payload/3);
    setSpeed(payload/10);
    setColour(color(255, 0, 155));
    // Create a new BoundingBox for the missile
    this.boundingBox = new BoundingBox(getX(), getY(), getWidth(), getHeight());
  }

  // Update the missile's position and its BoundingBox
  public void update() {
    if (explosion == null) {
      y -= speed;
      boundingBox.setX(getX());
      boundingBox.setY(getY());
    } else {
      y -= speed/5;
    }
  }

  public void explode() {
    explosion = new PuffBall(750, getPayload()/5, getPayload()*2, getX(), getY(), color(255, 255, 125, 255), color(255, 255, 255, 0));
    boundingBox = null;
  }

  public boolean isExpired() {
    if (explosion == null) {
      return false;
    }

    return explosion.isExpired();
  }

  // Display the missile on the screen
  public void display() {
    if (explosion == null) {
      fill(colour);
      rect(getX() - (getWidth() / 2), getY() - (getHeight() / 2), getWidth(), getHeight());
    } else {
      explosion.setY(y);
      explosion.update();
      explosion.display();
    }
  }
  /*********************/
  /* Getters & Setters */
  /*********************/

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

  public void setPayload(float payload) {
    this.payload = payload;
  }

  public float getPayload() {
    return this.payload;
  }
}
