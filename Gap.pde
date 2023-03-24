public class Gap { //<>// //<>//
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

    // Calculate the left and right x-pos of both gaps
    float left = getX();
    float right = getX() + getWidth();
    float otherLeft = other.getX();
    float otherRight = other.getX() + other.getWidth();

    // calculate the new left and right x-pos of the merged gap
    float newLeft = min(left, otherLeft);
    float newRight = max(right, otherRight);

    // Update the x-position and width of the current gap
    this.setX(newLeft);
    this.setWidth(newRight - newLeft);
  }

  // Update the gap's position
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

  public void setX(float x) {
    this.x = x;
  }

  public void setY(float y) {
    this.y = y;
  }

  public void setWidth(float w) {
    this.w = w;
  }

  public void setHeight(float h) {
    this.h = h;
  }

  public BoundingBox getBoundingBox() {
    return boundingBox;
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }

  public float getWidth() {
    return w;
  }

  public float getHeight() {
    return h;
  }

}
