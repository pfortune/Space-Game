public class Missile {
  private float x, y, w, h, speed;
  private color colour;
  
  public Missile(float x, float y){
    setX(x);
    setY(y);
    setWidth(5);
    setHeight(15);
    setSpeed(5);
    setColour(color(255,255,155));
  }
  
  /*********************/
  /* Getters & Setters */
  /*********************/
  
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
  
  public void setWidth(float w) {
    this.w = w;
  }
  
  public float getWidth() {
    return this.w;
  }
  
  public void setHeight(float h) {
    this.h = h;
  }
  
  public float getHeight() {
    return this.h;
  }
  
  public void setSpeed(float speed) {
    this.speed = speed;
  }
  
  public float getSpeed() {
    return this.speed;
  }
  
  public void setColour(color colour) {
    this.colour = colour;
  }
  
  public color getColour() {
    return this.colour;
  }
}
