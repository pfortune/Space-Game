public class Ship {
  // Declare instance variables
  private float speed, x, y, w, h;
  private color colour;
  private BoundingBox boundingBox;
  private PuffBall[] puffs;
  private Explosion explosion;
  private KeyHandler keyHandler;
  private Missile[] missiles;
  private float timeSinceLastFired;
  private int missileCount;
  private boolean isColliding;

  // Constructor for Ship class
  public Ship(KeyHandler keyhandler) {
    setX(width/2);
    setY(height - 45);
    setWidth(30);
    setHeight(40);
    setSpeed(100);
    setColour(color(122, 122, 255));
    setColliding(false);
    boundingBox = new BoundingBox(getX() - (getWidth()/2), getY() - (getHeight()/2), getWidth(), getHeight());
    this.puffs = new PuffBall[0];
    this.keyHandler = keyhandler;
    this.missiles = new Missile[0];
    timeSinceLastFired = 0;
    setMissile(10);
  }

  /**
   * Update method for the Ship class.
   * Parameters: float deltaTime - The time elapsed since the last frame.
   * This method updates the ship's position, bounding box, missiles, and puffballs based on user input and time elapsed.
   */
  public void update(float deltaTime) {
    if (this.explosion != null) {
      this.explosion.update();
      if (this.explosion.completed()) {
        this.explosion = null;
      }
    }
    // Update the bounding box position
    boundingBox.setX(getX() - (getWidth()/2));
    boundingBox.setY(getY() - (getHeight()/2));

    // Increment time since last missile fired
    timeSinceLastFired += deltaTime;

    // Create puffs if ship is moving
    if (this.keyHandler.isLeft() || this.keyHandler.isRight() || this.keyHandler.isUp() || this.keyHandler.isDown()) {
      float rand = random(0, 100);

      // Add puffs randomly based on random number generated
      if (rand > 95) {
        addPuff(getX() - 10, getY() + 30, color(255, 0, 0, 255));
      } else if (rand > 90) {
        addPuff(getX() + 10, getY() + 30, color(255, 125, 0, 255));
      }
    }

    // Fire missile when space key is pressed
    if (keyHandler.isSpace()) {
      fireMissile();
    }

    // Update missiles
    for (int i = 0; i < missiles.length; i++) {
      missiles[i].update();
    }

    // Remove expired puffs and missiles
    removeExpiredPuffs();
    removeExpiredMissiles();
  }

  public void respawn() {
    explosion = new Explosion(getX(), getY(), int(getHeight()*5));
    setX(width/2);
    setY(height - 45);
    boundingBox.setX(getX() - (getWidth()/2));
    boundingBox.setY(getY() - (getHeight()/2));
  }


  /**
   * Display method for the Ship class.
   * This method draws the ship, its rockets, puffballs, and missiles on the screen.
   */
  public void display() {
    if (this.explosion != null) {
      this.explosion.display();
    }
    // Ship body
    fill(colour);
    triangle(getX() - getWidth()/2, getY() + getHeight()/2, getX(), getY() - getHeight()/2, getX() + getWidth()/2, getY() + getHeight()/2);

    // Rockets, make darker than body
    color rocketColour = lerpColor(colour, color(0, 0, 0), 0.4);
    fill(rocketColour);
    rect(getX() - 15, getY() +5, 5, 20);
    rect(getX() + 10, getY() +5, 5, 20);

    // Make rocket flames
    color flameColour = color(255, 255, 189);
    fill(flameColour);
    rect(getX() - 15, getY() + 25, 5, 4);
    rect(getX() + 10, getY() + 25, 5, 4);

    // Update and display puffs
    for (int i = 0; i < puffs.length; i++) {
      PuffBall p = puffs[i];
      p.update();
      p.display();
    }

    // Display missiles
    for (int i = 0; i < missiles.length; i++) {
      Missile m = missiles[i];
      m.display();
    }

    getBoundingBox().display();
  }

  /**
   * Fires a missile from the ship if there are missiles available and the cooldown period has passed.
   */
  private void fireMissile() {
    // Check if the missile can be fired
    if (missileCount > 0 && timeSinceLastFired >= 0.4) {
      timeSinceLastFired = 0;
      Missile[] newArray = new Missile[missiles.length + 1];
      arrayCopy(missiles, newArray);
      newArray[missiles.length] = new Missile(getX(), getY() - getHeight() / 2, new Vector2(0, -1));
      missiles = newArray;
      missileCount--;
    }
  }

  /**
   * Adds a puffball to the ship's puffballs array at the specified position and with the specified starting colour.
   * Parameters: float x - The x-coordinate of the puffball.
   *             float y - The y-coordinate of the puffball.
   *             color startColour - The starting colour of the puffball.
   */
  private void addPuff(float x, float y, color startColour) {
    addPuff(new PuffBall(x, y, startColour));
  }

  private void addPuff(PuffBall puff) {
    PuffBall[] newArray = new PuffBall[puffs.length + 1];
    arrayCopy(puffs, newArray);
    newArray[puffs.length] = puff;
    puffs = newArray;
  }

  /**
   * Removes expired missiles from the ship's missiles array.
   */
  private void removeExpiredMissiles() {
    // Iterate through the missiles array and remove expired missiles
    for (int i = 0; i < missiles.length; i++) {
      Missile m = missiles[i];
      if (m.readyForCleanup()) {
        missiles = removeFromArray(missiles, i);
        i--; // Decrement index to account for removed item
      }
    }
  }

  /**
   * Removes a missile from the ship's missiles array at the specified index.
   * Parameters: Missile[] array - The array of missiles.
   *             int index - The index of the missile to be removed.
   * Return: A new array of missiles with the specified missile removed.
   */
  private Missile[] removeFromArray(Missile[] array, int index) {
    // Create a new array with one less element
    Missile[] newArray = new Missile[array.length - 1];
    // Copy elements from the original array, skipping the element at the specified index
    for (int i = 0, j = 0; i < array.length; i++) {
      if (i != index) {
        newArray[j++] = array[i];
      }
    }
    return newArray;
  }

  /**
   * Removes expired puffballs from the ship's puffballs array.
   */
  private void removeExpiredPuffs() {
    // Iterate through the puffs array and remove expired puffs
    for (int i = 0; i < puffs.length; i++) {
      PuffBall p = puffs[i];
      if ((millis() - p.spawnedAt) >= p.duration) {
        puffs = removeFromArray(puffs, i);
        i--; // Decrement index to account for removed item
      }
    }
  }

  /**
   * Removes a puffball from the ship's puffballs array at the specified index.
   * Parameters: PuffBall[] array - The array of puffballs.
   *             int index - The index of the puffball to be removed.
   * Return: A new array of puffballs with the specified puffball removed.
   */
  private PuffBall[] removeFromArray(PuffBall[] array, int index) {
    // Create a new array with one less element
    PuffBall[] newArray = new PuffBall[array.length - 1];
    // Copy elements from the original array, skipping the element at the specified index
    for (int i = 0, j = 0; i < array.length; i++) {
      if (i != index) {
        newArray[j++] = array[i];
      }
    }
    return newArray;
  }

  /**
   * Moves the ship based on user input and deltaTime.
   * Parameters: float deltaTime - The time elapsed since the last frame.
   */
  public void move(float deltaTime) {
    // Move ship left if the left key is pressed and the ship is not at the left edge
    if (keyHandler.isLeft() && getX() - (getWidth() / 2) > 0) {
      setX(getX() - (getSpeed() * deltaTime));
    }

    // Move ship right if the right key is pressed and the ship is not at the right edge
    if (keyHandler.isRight() && getX() + (getWidth() / 2) < width) {
      setX(getX() + (getSpeed() * deltaTime));
    }

    // Move ship up if the up key is pressed and the ship is not at the top edge
    if (keyHandler.isUp() && getY() - (getHeight() / 2) > 0) {
      setY(getY() - (getSpeed() * deltaTime));
    }

    // Move ship down if the down key is pressed and the ship is not at the bottom edge
    if (keyHandler.isDown() && getY() + (getHeight() / 2) < height) {
      setY(getY() + (getSpeed() * deltaTime));
    }
  }

  public void increaseMissileCount(int count) {
    this.missileCount += count;
  }

  public void addMissile() {
    this.missileCount++;
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

  public void setSpeed(float speed) {
    this.speed = speed;
  }

  public void setColour(color colour) {
    this.colour = colour;
  }

  public void setMissile(int count) {
    this.missileCount = count;
  }

  public void setColliding(boolean state) {
    this.isColliding = state;
  }

  public float getX() {
    return this.x;
  }

  public float getY() {
    return this.y;
  }

  public float getWidth() {
    return this.w;
  }

  public float getHeight() {
    return this.h;
  }

  public float getSpeed() {
    return this.speed;
  }

  public color getColour() {
    return this.colour;
  }

  public BoundingBox getBoundingBox() {
    return boundingBox;
  }

  public int getMissileCount() {
    return this.missileCount;
  }

  public Missile[] getMissiles() {
    return this.missiles;
  }

  public Missile getMissile(int index) {
    return this.missiles[index];
  }
}
