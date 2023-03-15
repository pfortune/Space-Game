float barrierHeight;
float lastBarrierSpawnTime;
float lastDrawTime;
int spawnInterval = 10000;
Barrier[] barriers;

void setup(){
  size(1280, 720);
  noStroke();
  lastDrawTime = millis();
  barrierHeight = 10;
  barriers = new Barrier[0];
  lastBarrierSpawnTime = -spawnInterval; // spawns barrier immediately
}

void draw(){
  background(0);
  
  float deltaTime = (millis() - lastDrawTime)/1000;
  lastDrawTime = millis();
  
  if (millis() - lastBarrierSpawnTime >= spawnInterval) {
    addBarrier(new Barrier());
    lastBarrierSpawnTime = millis();
  }
  
  for (int i=0; i < barriers.length; i++){
    if (barriers[i] == null){
      continue;
    }
    
    Barrier b = barriers[i];
    b.update(deltaTime);
    b.display();
  }
}

void addBarrier(Barrier b){
  Barrier[] newBarriers = new Barrier[barriers.length+1];
  arrayCopy(barriers, newBarriers);
  newBarriers[barriers.length] = b;
  barriers = newBarriers;
}
