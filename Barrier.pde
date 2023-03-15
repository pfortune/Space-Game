public class Barrier {
  float x, y, w, h, speed;
  color colour;
  
  public Barrier(float x, float y, float w, float h, float speed, color colour) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed = speed;
    this.colour = colour;
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
  }
  
  public void update(float deltaTime){
    this.y += this.speed * deltaTime;
  }
  
  public void display(){
    fill(this.colour);
    rect(this.x, this.y, this.w, this.h);
  }
}
