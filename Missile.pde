public class Missile {
  // Declare instance variables
  private float x, y, w, h, speed, payload;
  private color colour;
  private int lifetime;
  private int timeSpawned;
  private BoundingBox boundingBox;
  private PuffBall explosion;
  private Vector2 direction;

  // Constructor for Missile class
  public Missile(float x, float y, Vector2 dir) {
    this();
    setX(x);
    setY(y);
    this.direction = dir;
    this.lifetime = 5000;
    this.timeSpawned = millis();
  }

  // Default constructor for Missile class
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
      setX(getX() + direction.x * speed);
      setY(getY() + direction.y * speed);
      boundingBox.setX(getX());
      boundingBox.setY(getY());
    } else {
      y -= speed/5;
    }
  }

  // Check if the missile is ready to be cleaned up
  public boolean readyForCleanup() {
    // If the missile has been alive for more than its lifetime, return true
    if (millis() - timeSpawned >= lifetime) {
      return true;
    }

    // If the missile has exploded and the explosion has finished, return true
    if (explosion != null && explosion.isExpired()) {
      return true;
    }

    return false;
  }

  // Create an explosion at the missile's current location
  public void explode() {
    explosion = new PuffBall(750, getPayload()/5, getPayload()*2, getX(), getY(), color(255, 255, 125, 255), color(255, 255, 255, 0));
    boundingBox = null;
  }

  // Check if the missile has expired
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
      // Update and display the explosion
      explosion.setY(y);
      explosion.update();
      explosion.display();
    }
  }

  /*********************/
  /* Getters & Setters */
  /*********************/

  // Get the BoundingBox object for the missile
  public BoundingBox getBoundingBox() {
    return this.boundingBox;
  }

  // Set the x-coordinate of the missile
  public void setX(float x) {
    this.x = x;
  }

  // Get the x-coordinate of the missile
  public float getX() {
    return this.x;
  }

  // Set the y-coordinate of the missile
  public void setY(float y) {
    this.y = y;
  }

  // Get the y-coordinate of the missile
  public float getY() {
    return this.y;
  }

  // Set the width of the missile
  public void setWidth(float w) {
    this.w = w;
  }

  // Get the width of the missile
  public float getWidth() {
    return this.w;
  }

  // Set the height of the missile
  public void setHeight(float h) {
    this.h = h;
  }

  // Get the height of the missile
  public float getHeight() {
    return this.h;
  }

  // Set the speed of the missile
  public void setSpeed(float speed) {
    this.speed = speed;
  }

  // Get the speed of the missile
  public float getSpeed() {
    return this.speed;
  }

  // Set the color of the missile
  public void setColour(color colour) {
    this.colour = colour;
  }

  // Get the color of the missile
  public color getColour() {
    return this.colour;
  }

  // Set the payload of the missile
  public void setPayload(float payload) {
    this.payload = payload;
  }

  // Get the payload of the missile
  public float getPayload() {
    return this.payload;
  }
}
