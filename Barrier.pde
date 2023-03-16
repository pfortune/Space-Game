public class Barrier {
  float x, y, w, h, speed;
  color colour;
  BoundingBox boundingBox;
  
  public Barrier(float x, float y, float w, float h, float speed, color colour) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed = speed;
    this.colour = colour;
    this.boundingBox = new BoundingBox(x, y, w, h);
  }
  
  public Barrier(float speed){
    this();
    this.speed = speed;
  }
  
  public Barrier() {
    this.h = 10;
    this.x = -10;
    this.y = -h;
    this.w = width + 20;
    this.speed = 50;
    this.colour = color(255,255,122);
    this.boundingBox = new BoundingBox(x, y, w, h);
  }
  
  public void update(float deltaTime){
    this.y += this.speed * deltaTime;
    boundingBox.y = this.y;
  }
  
  public void display(){
    fill(this.colour);
    rect(this.x, this.y, this.w, this.h);
  }
  
  public BoundingBox getBoundingBox(){
    return boundingBox;
  }
}
