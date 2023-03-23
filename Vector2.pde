public class Vector2 {
   public float x, y;
   
   public Vector2() {
     x = y = 0;
   }
   
   public Vector2(float x, float y){
     this.x = x;
     this.y = y;
   }
   
   public void normalizeFrom(float x1, float y1, float x2, float y2) {
    float dx = x2 - x1;
    float dy = y2 - y1;
    float distance = sqrt(dx * dx + dy * dy);

    x = dx / distance;
    y = dy / distance;
   }
   
  /*********************/
  /* Getters & Setters */
  /*********************/
}
