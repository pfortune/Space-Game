public class Gap {
  // Declare instance variables for position, size, speed, color, and bounding box
  private float x, y, w, h, speed;
  private BoundingBox boundingBox;

  // Constructor with all parameters
  public Gap(float x, float y, float w, float h, float speed) {
    // Set the instance variables using the provided values
    setX(x);
    setY(y);
    setWidth(w);
    setHeight(h);
    setSpeed(speed);
    // Initialise the bounding box
    this.boundingBox = new BoundingBox(getX()+(getWidth()/2), getY(), 0, getHeight());
  }

  // Constructor with speed parameter
  public Gap(float speed) {
    this(); // Call the default constructor
    setSpeed(speed);
  }

  // Default constructor
  public Gap() {
    // Set default values for the gap
    setHeight(10);
    setX(200);
    setY(-getHeight());
    setWidth(200);
    setSpeed(20);
    // Initialise the bounding box
    this.boundingBox = new BoundingBox(getX()+(getX()/2), getY(), 0, getHeight());
  }

  // Update the gap's position based on its speed and deltaTime
  public void update(float deltaTime) {
    setY(getY() + getSpeed() * deltaTime);
    boundingBox.setY(getY()); // Update the bounding box's Y position
  }

  // Display the gap on the screen
  public void display() {
    fill(0);
    rect(getX(), getY(), getWidth(), getHeight());
  }

  /*********************/
  /* Getters & Setters */
  /*********************/

  public BoundingBox getBoundingBox() {
    return boundingBox;
  }

  public float getX() {
    return x;
  }

  public void setX(float x) {
    this.x = x;
  }

  public float getY() {
    return y;
  }

  public void setY(float y) {
    this.y = y;
  }

  public float getWidth() {
    return w;
  }

  public void setWidth(float w) {
    this.w = w;
  }

  public float getHeight() {
    return h;
  }

  public void setHeight(float h) {
    this.h = h;
  }

  public float getSpeed() {
    return speed;
  }

  public void setSpeed(float speed) {
    this.speed = speed;
  }
}
