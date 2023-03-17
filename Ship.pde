public class Ship {
  private float speed, x, y, w, h;
  private color colour;
  private BoundingBox boundingBox;
  private PuffBall[] puffs;

  public Ship() {
    setX(width/2);
    setY(height - 45);
    setW(30);
    setH(40);
    setSpeed(100);
    setColour(color(122, 122, 255));
    boundingBox = new BoundingBox(getX() - (getW()/2), getY() - (getH()/2), getW(), getH());
    this.puffs = new PuffBall[0];
  }

  public void update(float deltaTime) {
    if (getX() == mouseX) {
      return;
    }

    if (abs(getX()-mouseX) <= getSpeed() * deltaTime) {
      setX(mouseX);
      boundingBox.setX(getX() - (getW()/2));
      return;
    }

    if ((mouseX - getX()) > 0) {
      setX(getX() + getSpeed() * deltaTime);
    } else {
      setX(getX() - getSpeed() * deltaTime);
    }

    boundingBox.setX(getX() - (getW()/2));

    float rand = random(0, 100);

    if (rand > 95) {
      addPuff(getX() - 10, getY() + 30, color(255, 0, 0, 255));
    } else if (rand > 90) {
      addPuff(getX() + 10, getY() + 30, color(255, 125, 0, 255));
    }

    removeExpiredPuffs();
  }

  public void display() {
    // Ship body
    fill(colour);
    triangle(getX() - getW()/2, getY() + getH()/2, getX(), getY() - getH()/2, getX() + getW()/2, getY() + getH()/2);

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

    for (int i = 0; i < puffs.length; i++) {
      PuffBall p = puffs[i];
      p.update();
      p.display();
    }

    System.out.println("Size of the puffs array: " + puffs.length);
  }

  public void addPuff(float x, float y, color startColour) {
    PuffBall[] newArray = new PuffBall[puffs.length + 1];
    arrayCopy(puffs, newArray);
    newArray[puffs.length] = new PuffBall(x, y, startColour);
    puffs = newArray;
  }

  private void removeExpiredPuffs() {
    for (int i = 0; i < puffs.length; i++) {
      PuffBall p = puffs[i];
      if ((millis() - p.spawnedAt) >= p.duration) {
        System.out.println("Removing expired puff at index " + i);
        puffs = removeFromArray(puffs, i);
        i--; // Decrement index to account for removed item
      }
    }
  }

  private PuffBall[] removeFromArray(PuffBall[] array, int index) {
    PuffBall[] newArray = new PuffBall[array.length - 1];
    for (int i = 0, j = 0; i < array.length; i++) {
      if (i == index) {
        continue;
      }
      newArray[j++] = array[i];
    }
    return newArray;
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
    return this.y;
  }

  public void setY(float y) {
    this.y = y;
  }

  public float getW() {
    return this.w;
  }

  public void setW(float w) {
    this.w = w;
  }

  public float getH() {
    return this.h;
  }

  public void setH(float h) {
    this.h = h;
  }

  public float getSpeed() {
    return this.speed;
  }

  public void setSpeed(float speed) {
    this.speed = speed;
  }

  public color getColour() {
    return this.colour;
  }

  public void setColour(color colour) {
    this.colour = colour;
  }

  public BoundingBox getBoundingBox() {
    return boundingBox;
  }
}
