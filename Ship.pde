public class Ship {
  float speed, x, y, w, h;
  color colour;
  BoundingBox boundingBox;
  PuffBall[] puffs;

  public Ship() {
    this.x = width/2;
    this.y = height - 45;
    this.w = 30;
    this.h = 40;
    this.speed = 100;
    this.colour = color(122, 122, 255);
    boundingBox = new BoundingBox(x - (w/2), y - (h/2), w, h);
    this.puffs = new PuffBall[0];
  }

  public void update(float deltaTime) {
    if (x == mouseX) {
      return;
    }

    if (abs(x-mouseX) <= speed * deltaTime) {
      x = mouseX;
      boundingBox.x = x - (w/2);
      return;
    }

    if ((mouseX - x) > 0) {
      x += speed * deltaTime;
    } else {
      x -= speed * deltaTime;
    }

    boundingBox.x = x - (w/2);

    float rand = random(0, 100);

    if (rand > 95) {
      addPuff(x - 10, y + 30, color(255, 0, 0, 255));
    } else if (rand > 90) {
      addPuff(x + 10, y + 30, color(255, 125, 0, 255));
    }
  }

  public void display() {
    // Ship body
    fill(colour);
    triangle(x - w/2, y + h/2, x, y - h/2, x + w/2, y + h/2);

    // Rockets, make darker than body
    color rocketColour = lerpColor(colour, color(0, 0, 0), 0.4);
    fill(rocketColour);
    rect(x - 15, y +5, 5, 20);
    rect(x + 10, y +5, 5, 20);

    // Make rocket flames
    color flameColour = color(255, 255, 189);
    fill(flameColour);
    rect(x - 15, y + 25, 5, 4);
    rect(x + 10, y + 25, 5, 4);

    for (int i = 0; i < puffs.length; i++) {
      PuffBall p = puffs[i];
      p.update();
      p.display();
    }
  }

  public float getX() {
    return this.x;
  }

  public float getY() {
    return this.y;
  }

  public void addPuff(float x, float y, color startColour) {
    PuffBall[] newPuffs = new PuffBall[puffs.length + 1];
    arrayCopy(puffs, newPuffs);
    newPuffs[puffs.length] = new PuffBall(1000, 4, 20, x, y, startColour, color(255, 255, 255, 0));
    puffs = newPuffs;
  }

  public BoundingBox getBoundingBox() {
    return boundingBox;
  }
}
