public class BoundingBox {
  // Declare instance variables for position and size
  private float x, y, w, h;
  private boolean debugging=false;
  
  // Constructor with all parameters
  public BoundingBox(float x, float y, float w, float h) {
    
    // Set the instance variables using the provided values
    setX(x);
    setY(y);
    setWidth(w);
    setHeight(h);
  }

  public void display(){
    if(this.debugging){
       fill(255,0,0);
       rect(getX(), getY(), getWidth(), getHeight());
    }
  }

  // Check if this bounding box has collided with another bounding box
  public boolean hasCollided(BoundingBox other) {
    // Check if the two bounding boxes overlap on the x-axis
    boolean xOverlap = (this.x < other.getX() + other.getWidth()) && (this.x + this.w > other.getX());
    // Check if the two bounding boxes overlap on the y-axis
    boolean yOverlap = (this.y < other.getY() + other.getHeight()) && (this.y + this.h > other.getY());

    // Return true if the bounding boxes overlap in both the x-axis and y-axis
    return xOverlap && yOverlap;
  }
  
  public boolean containsOnX(BoundingBox other) {
    return (this.getX() < other.getX() && (other.getX() + other.getWidth()) < (this.getX() + this.getWidth()));
  }
  
  public boolean containsOnY(BoundingBox other) {
    return (this.getY() < other.getY() && (other.getY() + other.getHeight()) < (this.getY() + this.getHeight()));
  }
  
  public boolean contains(BoundingBox other) {
    return this.containsOnX(other) && this.containsOnY(other);
  }

  /*********************/
  /* Getters & Setters */
  /*********************/

  public float getX() {
    return this.x;
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
    return this.w;
  }

  public void setWidth(float w) {
    this.w = w;
  }

  public float getHeight() {
    return this.h;
  }

  public void setHeight(float h) {
    this.h = h;
  }
}
