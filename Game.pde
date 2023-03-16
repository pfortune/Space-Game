float barrierHeight;
float lastBarrierSpawnTime;
float lastDrawTime;
int spawnInterval = 10000;
Barrier[] barriers;
Ship ship;

void setup() {
  size(1280, 720);
  noStroke();
  lastDrawTime = millis();
  barrierHeight = 10;
  barriers = new Barrier[0];
  lastBarrierSpawnTime = -spawnInterval; // spawns barrier immediately
  ship = new Ship();
}

void draw() {
  background(0);

  float deltaTime = (millis() - lastDrawTime)/1000;
  lastDrawTime = millis();

  if (millis() - lastBarrierSpawnTime >= spawnInterval) {
    addBarrier(new Barrier());
    lastBarrierSpawnTime = millis();
  }

  for (int i=0; i < barriers.length; i++) {
    if (barriers[i] == null) {
      continue;
    }

    Barrier b = barriers[i];
    b.update(deltaTime);
    b.display();

    if (b.getBoundingBox().hasCollided(ship.getBoundingBox())) {
      println("collision");
    }
  }

  System.out.println("Size of the barriers array: " + barriers.length);

  ship.update(deltaTime);
  ship.display();
  
  removeBarriers();
}

void addBarrier(Barrier b) {
  Barrier[] newBarriers = new Barrier[barriers.length+1];
  arrayCopy(barriers, newBarriers);
  newBarriers[barriers.length] = b;
  barriers = newBarriers;
}

private void removeBarriers() {
    for (int i = 0; i < barriers.length; i++) {
      Barrier b = barriers[i];
      if (b.getY() >= height) {
        System.out.println("Barriers no longer visible on screen: " + i);
        barriers = removeFromArray(barriers, i);
        i--; // Decrement index to account for removed item
      }
    }
  }

  private Barrier[] removeFromArray(Barrier[] array, int index) {
    Barrier[] newArray = new Barrier[array.length - 1];
    for (int i = 0, j = 0; i < array.length; i++) {
      if (i == index) {
        continue;
      }
      newArray[j++] = array[i];
    }
    return newArray;
  }
