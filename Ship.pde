public class Ship {
  float speed, x, y, w, h;
  color colour;
  
  public Ship(){
    this.x = width/2;
    this.y = height - 45;
    this.w = 30;
    this.h = 40;
    this.speed = 100;
    this.colour = color(122, 122, 255);
  }
  
  public void update(float deltaTime){
    if(x == mouseX){
      return;
    }
    
    if(abs(x-mouseX) <= speed * deltaTime) {
      x = mouseX;
      return;
    }
    
    if((mouseX - x) > 0) {
      x += speed * deltaTime;
    } else {
      x -= speed * deltaTime;
    }
  }
  
  public void display() {
    // Ship body
    fill(colour);
    triangle(x - w/2, y + h/2, x, y - h/2, x + w/2, y + h/2);
    
    // Rockets, make darker than body
    color rocketColour = lerpColor(colour, color(0,0,0), 0.4);
    fill(rocketColour);
    rect(x - 15, y +5, 5, 20);
    rect(x + 10, y +5, 5, 20);
    
    // Make rocket flames
    color flameColour = color(255,255,189);
    fill(flameColour);
    rect(x - 15, y + 25, 5, 4);
    rect(x + 10, y + 25, 5, 4);
  }
  
  public float getX() {
    return this.x;
  }
  
  public float getY() {
    return this.y;
  }
}
