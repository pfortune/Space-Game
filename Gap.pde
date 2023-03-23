public class Gap { //<>//
  // Declare instance variables for position, size, speed, color, and bounding box
  private float x, y, w, h;
  private BoundingBox boundingBox;

  // Constructor with all parameters
  public Gap(float x, float y, float w, float h) {
    this();
    // Set the instance variables using the provided values
    setX(x);
    setY(y);
    setWidth(w);
    setHeight(h);
    // Initialise the bounding box
    this.boundingBox = new BoundingBox(getX(), getY(), getWidth(), getHeight());
  }

  // Default constructor
  public Gap() {
    // Set default values for the gap
    setHeight(10);
    setX(200);
    setY(-getHeight());
    setWidth(200);
    // Initialise the bounding box
    this.boundingBox = new BoundingBox(getX(), getY(), getWidth(), getHeight());
  }

  public void merge(Gap other) {
    //are gaps directly on top of each other?
    if (getX() == other.getX() && getWidth() == other.getWidth()) {
      return;
    }
    if (getX() < other.getX()) { //<>//
      float gapOffset = (other.getX() - getX());
      this.setWidth(other.getWidth() + gapOffset);
    } else {
      float gapOffset = (getX() + getWidth()) - (other.getX() + other.getWidth());
      this.setWidth(other.getWidth() + gapOffset);
      this.setX(other.getX());
    }
  }

  // Update the gap's position based on its speed and deltaTime
  public void update() {
    boundingBox.setX(getX());
    boundingBox.setWidth(getWidth());
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
}
