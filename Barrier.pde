public class Barrier {
  private float x, y, w, h, speed;
  private color colour;
  private BoundingBox boundingBox;

  public Barrier(float x, float y, float w, float h, float speed, color colour) {
    setX(x);
    setY(y);
    setWidth(w);
    setHeight(h);
    setSpeed(speed);
    setColour(colour);
    this.boundingBox = new BoundingBox(x, y, w, h);
  }

  public Barrier(float speed) {
    this();
    setSpeed(speed);
  }

  public Barrier() {
    setHeight(10);
    setX(-10);
    setY(-getHeight());
    setWidth(width + 20);
    setSpeed(50);
    setColour(color(255, 255, 122));
    this.boundingBox = new BoundingBox(getX(), getY(), getWidth(), getHeight());
  }

  public void update(float deltaTime) {
    setY(getY() + getSpeed() * deltaTime);
    boundingBox.setY(getY());
  }

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
