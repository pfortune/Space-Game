public class Explosion {
  // Private instance variables
  private PuffBall[] puffs;
  private float x, y;
  private int size;
  private int numExplosions;

  /**
   * Constructor
   */
  public Explosion(float x, float y, int size) {
    setX(x);
    setY(y);
    setSize(size);
    this.numExplosions = ceil(size/2);
    this.puffs = new PuffBall[this.numExplosions];

    color start = color(255, 0, 0, 255);
    color end = color(255, 255, 255, 0);

    // Create the main big explosion PuffBall object
    // with the following parameters:
    // duration = size * 15
    // startRadius = size / 2
    // endRadius = size * 2
    this.puffs[0] = new PuffBall(size*15, size/2, size*2, getX(), getY(), color(255, 0, 0, 125), end);

    // Create the remaining PuffBall objects with random parameters
    for (int i=1; i<this.numExplosions; i++) {
      float puffX = random(-size/6, size/6) + getX();
      float puffY = random(-size/6, size/6) + getY();
      float puffStart = random(size/15, size/10);
      float puffEnd = random(size/5, size/3);
      int puffDuration = int(random(size, size*10));
      this.puffs[i] = new PuffBall(puffDuration, puffStart, puffEnd, puffX, puffY, start, end);
    }
  }

  /**
   * Update method to update all the PuffBall objects in the explosion.
   */
  public void update() {
    int i = 0;
    while (i < puffs.length) {
      if (puffs[i] == null) {
        i++;
        continue;
      }
      puffs[i].update();
      i++;
    }
  }

  /**
   * Display method to display all the PuffBall objects in the explosion.
   */
  public void display() {
    int i = 0;
    while (i < puffs.length) {
      if (puffs[i] == null) {
        i++;
        continue;
      }
      puffs[i].display();
      i++;
    }
  }

  /**
   * Check if the explosion is completed, i.e., all the PuffBall objects have expired.
   * Return True if the explosion is completed, false otherwise.
   */
  public boolean completed() {
    int i = 0;
    while (i < puffs.length) {
      if (puffs[i] == null) {
        i++;
        continue;
      }
      if (!puffs[i].isExpired()) {
        return false;
      }
      i++;
    }
    return true;
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

  public void setSize(int size) {
    this.size = size;
  }

  public void setPuffs(PuffBall[] puffs) {
    this.puffs = puffs;
  }

  public void setNumExplosions(int numExplosions) {
    this.numExplosions = numExplosions;
  }

  public float getX() {
    return this.x;
  }

  public float getY() {
    return this.y;
  }

  public PuffBall[] getPuffs() {
    return this.puffs;
  }

  public int getSize() {
    return this.size;
  }

  public int getNumExplosions() {
    return this.numExplosions;
  }
}
