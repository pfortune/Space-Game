public class Barrier { //<>//
  // Declare instance variables for position, size, speed, color, and bounding box
  private float x, y, w, h, speed;
  private color colour;
  private BoundingBox boundingBox;
  private Gap[] gaps;

  // Constructor with all parameters
  public Barrier(float x, float y, float w, float h, float speed, color colour) {
    // Set the instance variables using the provided values
    this(speed);
    setX(x);
    setY(y);
    setWidth(w);
    setHeight(h);
    setColour(colour);
    gaps = new Gap[0];
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
    gaps = new Gap[0];
    setColour(color(255, 255, 122));
    // Initialise the bounding box
    this.boundingBox = new BoundingBox(getX(), getY(), getWidth(), getHeight());
  }

  public boolean collisionCheck(BoundingBox other) {
    if (!this.boundingBox.hasCollided(other)) {
      return false;
    }

    for (int i=0; i<gaps.length; i++) {
      if (gaps[i] == null) {
        continue; // Skip if the gap is null (removed)
      }
      Gap g = gaps[i];

      if (g.getBoundingBox().containsOnX(other)) {
        return false;
      }
    }
    return true;
  }

  private void collided(float x, float payload) {
    addGap(new Gap(x-ship.getWidth(), getY(), 50, getHeight()*2));
  }

  // Update the barrier's position based on its speed and deltaTime
  public void update(float deltaTime) {
    setY(getY() + getSpeed() * deltaTime);
    boundingBox.setY(getY()); // Update the bounding box's Y position

    for (int i=0; i<gaps.length; i++) {
      if (gaps[i] == null) {
        continue; // Skip if the gap is null (removed)
      }

      Gap g = gaps[i];
      g.setY(this.y);
      g.update();
    }
  }

  // Display the barrier on the screen
  public void display() {
    fill(getColour());
    rect(getX(), getY(), getWidth(), getHeight());

    for (int i=0; i<gaps.length; i++) {
      if (gaps[i] == null) {
        continue; // Skip if the gap is null (removed)
      }

      Gap g = gaps[i];
      g.display();
    }
  }

  // Add a new gap to a barrier
  public void addGap(Gap newGap) {
    
    int gapsToRemove = 0;
    
    //boolean[] toRemove = new boolean[gaps.length];
    for (int i=0; i<gaps.length; i++) {
      if (gaps[i] == null) {
        continue; // Skip if the gap is null (removed)
      }
      
      Gap g = gaps[i];
      
      //toRemove[i]=false;
      if (g.getBoundingBox().hasCollided(newGap.getBoundingBox())) {
        newGap.merge(g);
        gaps[i] = null;
        gapsToRemove++;
      }
    }
    
    Gap[] newArray = new Gap[gaps.length - gapsToRemove + 1];
    int newIndex = 0;
    
    for(int i = 0; i <gaps.length; i++) {
      if(gaps[i] != null) {
        newArray[newIndex++] = gaps[i];
      }
    }
    newArray[newIndex] = newGap;
    // Set the new array as the gaps array
    gaps = newArray;
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
