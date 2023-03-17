float barrierHeight;
float lastBarrierSpawnTime;
float lastDrawTime;
int spawnInterval = 30000;
KeyHandler keyHandler;
Barrier[] barriers;
Ship ship;

void setup() {
  size(1280, 720);
  noStroke();
  lastDrawTime = millis();
  barrierHeight = 10;
  barriers = new Barrier[0];
  lastBarrierSpawnTime = -spawnInterval; // spawns barrier immediately
  keyHandler = new KeyHandler();
  ship = new Ship(keyHandler);
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
      //println("collision");
    }
  }

  //System.out.println("Size of the barriers array: " + barriers.length);

  ship.move(deltaTime);
  ship.update(deltaTime);
  ship.display();

  removeBarriers();
  
  textSize(20);
  textAlign(CENTER, CENTER);
  text("Missiles: " + ship.getMissileCount(), width / 2, 30);
}

public void addBarrier(Barrier b) {
  Barrier[] newArray = new Barrier[barriers.length+1];
  arrayCopy(barriers, newArray);
  newArray[barriers.length] = b;
  barriers = newArray;
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

public void keyPressed() {
  if (key == 'a' || key == 'A' || keyCode == LEFT) {
    keyHandler.setLeft(true);
  }
  if (key == 'd' || key == 'D' || keyCode == RIGHT) {
    keyHandler.setRight(true);
  }
  if (key == 'w' || key == 'W' || keyCode == UP) {
    keyHandler.setUp(true);
  }
  if (key == 's' || key == 'S' || keyCode == DOWN) {
    keyHandler.setDown(true);
  }
  if (key == ' ' || keyCode == 32) {
    keyHandler.setSpace(true);
  }
}

public void keyReleased() {
  if (key == 'a' || key == 'A' || keyCode == LEFT) {
    keyHandler.setLeft(false);
  }
  if (key == 'd' || key == 'D' || keyCode == RIGHT) {
    keyHandler.setRight(false);
  }
  if (key == 'w' || key == 'W' || keyCode == UP) {
    keyHandler.setUp(false);
  }
  if (key == 's' || key == 'S' || keyCode == DOWN) {
    keyHandler.setDown(false);
  }
  if (key == ' ' || keyCode == 32) {
    keyHandler.setSpace(false);
  }
}
