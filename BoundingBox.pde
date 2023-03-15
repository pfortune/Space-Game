public class BoundingBox {
  public float x, y, w, h;
  
  public BoundingBox(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public boolean hasCollided(BoundingBox other){
    return (this.x < other.x + other.w && this.x + this.w > other.x && this.y < other.y + other.h && this.y + this.h > other.y);
  }
}
