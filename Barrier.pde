public class Barrier {
  // Declare instance variables for position, size, speed, color, and bounding box
  private float x, y, w, h, speed;
  private color colour;
  private BoundingBox boundingBox;


  // Constructor with all parameters
  public Barrier(float x, float y, float w, float h, float speed, color colour) {
    // Set the instance variables using the provided values
    setX(x);
    setY(y);
    setWidth(w);
    setHeight(h);
    setSpeed(speed);
    setColour(colour);
    // Initialise the bounding box
    this.boundingBox = new BoundingBox(x, y, w, h);
  }

  // Constructor with speed parameter
  public Barrier(float speed) {
    this(); // Call the default constructor
    setSpeed(speed);
  }

  // Default constructor
  public Barrier() {
    // Set default values for the barrier
    setHeight(10);
    setX(-10);
    setY(-getHeight());
    setWidth(width + 20);
    setSpeed(20);
    setColour(color(255, 255, 122));
    // Initialise the bounding box
    this.boundingBox = new BoundingBox(getX(), getY(), getWidth(), getHeight());
  }
  
  private void collided(float x, float payload){
    println("barrier missile collision at x: " + x);
    println("missile payload: " + payload);
  }

  // Update the barrier's position based on its speed and deltaTime
  public void update(float deltaTime) {
    setY(getY() + getSpeed() * deltaTime);
    boundingBox.setY(getY()); // Update the bounding box's Y position
  }

  // Display the barrier on the screen
  public void display() {
    fill(getColour());
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

  public color getColour() {
    return colour;
  }

  public void setColour(color colour) {
    this.colour = colour;
  }
}
