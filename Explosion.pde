public class Explosion {
   public PuffBall[] puffs;
   public float x, y;
   public int size;
   public int numExplosions;
   
   public Explosion(float x, float y, int size) {
     this.x = x;
     this.y = y;
     this.size = size;
     this.numExplosions = ceil(size/2);
     this.puffs = new PuffBall[this.numExplosions];
     
     color start = color(255,0,0,255);
     color end = color(255,255,255,0);
     
     //(int duration, float startRadius, float endRadius, float x, float y, color startColour, color endColour)
     //main big explosion
     this.puffs[0] = new PuffBall(size*15, float(size)/2, float(size)*2, x, y, color(255,0,0,125), end);
     for( int i=1;i<this.numExplosions;i++){
        float puffX = random(-size/6, size/6)+x; 
        float puffY = random(-size/6, size/6)+y; 
        float puffStart = random(size/15, size/10);
        float puffEnd = random(size/5, size/3);
        int puffDuration = int(random(size, size*10));
        this.puffs[i] = new PuffBall(puffDuration, puffStart, puffEnd, puffX, puffY, start, end);
     }
   }
   
   
   public void update(){
     for(int i=0;i<puffs.length;i++){
        if(this.puffs[i] == null){
          continue;
        }
        this.puffs[i].update();
     }
   }
   
   public void display() {
     for(int i=0;i<puffs.length;i++){
        if(this.puffs[i] == null){
          continue;
        }
        this.puffs[i].display();
     }
   }
   
   public boolean completed() {
     for(int i=0;i<puffs.length;i++){
        if(this.puffs[i] == null){
          continue;
        }
        if(!this.puffs[i].isExpired()){
          return false;
        }
     }
     
     return true;
   }
   
  /*********************/
  /* Getters & Setters */
  /*********************/
   
   
}
