class Enemy {

  private float x, y, speed;
  private Missile[] missiles;
  private float timeLastFired;
  private float reloadTime;
  private BoundingBox boundingBox;
  private boolean isDead;
  private Explosion explosion;

  public Enemy(float x, float y, float speed) {
    setX(x);
    setY(y);
    setSpeed(speed);
    boundingBox = new BoundingBox(getX() - 20, getY() - 40, 40, 40);
    setDead(false);
    reloadTime = 2000;
    missiles = new Missile[0];
  }

  public void update(Ship ship) {
    for (int i = 0; i < missiles.length; i++) {
      missiles[i].update();
      
      if (missiles[i].readyForCleanup()) {
        removeMissile(i);
        i--; // Decrement index to account for removed item
      }
    }

    if(explosion != null){
      explosion.update();
    }

    if (isDead()) {
      return;
    }

    if (millis() - timeLastFired >= reloadTime) {
      fireMissile();
      timeLastFired = millis();
    }

    Vector2 dir = new Vector2();
    dir.normalizeFrom(getX(), getY(), ship.getX(), ship.getY());

    // Update the enemy's position
    x += dir.x * speed;
    y += dir.y * speed;

    // Update the enemy's bounding box
    boundingBox.setX(getX() - 20);
    boundingBox.setY(getY() - 40);
  }

  public void display() {
    for (int i = 0; i < missiles.length; i++) {
      missiles[i].display();
    }

    if(explosion != null){
      explosion.display();
    }

    if (isDead()) {
      return;
    }
    // Main body (triangle)
    fill(200, 30, 30);
    triangle(getX(), getY(), getX() - 20, getY() - 40, getX() + 20, getY() - 40);

    // Cabin (rectangle)
    fill(100, 100, 100);
    rect(getX() - 5, getY() - 30, 10, 10);
  }

  public boolean readyForCleanup() {
    if (!isDead()) {
      return false;
    }

    if (missiles != null && missiles.length > 0) {
      return false;
    }
    
    if(!explosion.completed()){
      return false;
    }

    return true;
  }
  
   public void fireMissile() {
    // Check if the missile can be fired
    Missile[] newArray = new Missile[missiles.length + 1];
    arrayCopy(missiles, newArray);
    // set a fixed direction downward
    Vector2 direction = new Vector2(0, 1);
    newArray[missiles.length] = new Missile(getX(), getY() + 20, direction);
    missiles = newArray;
  }

  public void removeMissile(int index) {
    Missile[] newArray = new Missile[missiles.length - 1];
    for (int i = 0, j = 0; i < missiles.length; i++) {
      if (i != index) {
        newArray[j++] = missiles[i];
      }
    }
    missiles = newArray;
  }
  
  /*********************/
  /* Getters & Setters */
  /*********************/

  public BoundingBox getBoundingBox() {
    return boundingBox;
  }

  public void setSpeed(float speed) {
    this.speed = speed;
  }

  public float getSpeed() {
    return this.speed;
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

  public Missile[] getMissiles() {
    return this.missiles;
  }

  public Missile getMissile(int index) {
    return this.missiles[index];
  }

  public void setDead(boolean state) {
    this.isDead = state;
    if(state == true) {
       this.explosion = new Explosion(getX(), getY(), 150); 
    }
  }

  public boolean isDead() {
    return this.isDead;
  }
}
