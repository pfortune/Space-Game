import javax.swing.JOptionPane;

// Objects required in the program
KeyHandler keyHandler;
Barrier[] barriers;
Player player;
Ship ship;

float barrierHeight;
float lastBarrierSpawnTime;
float lastDrawTime;
int spawnInterval = 30000;

void setup() {
  size(1280, 720);
  noStroke();
  lastDrawTime = millis();
  barrierHeight = 10;
  barriers = new Barrier[0];
  lastBarrierSpawnTime = -spawnInterval; // spawns barrier immediately
  keyHandler = new KeyHandler();
  ship = new Ship(keyHandler);

  String playerName = JOptionPane.showInputDialog(null, "Enter your name:", "Player Name", JOptionPane.QUESTION_MESSAGE);
  if (playerName == null || playerName.trim().isEmpty()) {
    playerName = "Player1";
  }

  player = new Player(playerName.trim(), 3);
}

void draw() {
  // Set the background color to black
  background(0);

  // Calculate the time elapsed since the last draw call
  float deltaTime = (millis() - lastDrawTime)/1000;
  lastDrawTime = millis();

  // Spawn a new barrier if it's time to spawn one
  if (millis() - lastBarrierSpawnTime >= spawnInterval) {
    addBarrier(new Barrier());
    lastBarrierSpawnTime = millis();
  }

  // Initialize a flag for checking if the ship is colliding with any barriers
  boolean isCollidingWithAnyBarrier = false;

  // Loop through all barriers
  for (int i = 0; i < barriers.length; i++) {
    if (barriers[i] == null) {
      continue; // Skip if the barrier is null (removed)
    }

    Barrier b = barriers[i];
    b.update(deltaTime); // Update barrier state
    b.display(); // Draw the barrier

    // Check if the ship is colliding with the current barrier
    if (b.getBoundingBox().hasCollided(ship.getBoundingBox())) {
      isCollidingWithAnyBarrier = true;
    }
  }

  // If the ship is colliding with any barriers
  if (isCollidingWithAnyBarrier) {
    if (!ship.isColliding()) {
      println("collision");
      player.loseLife(); // Reduce player's lives
      ship.setColliding(true); // Set the ship's collision status to true
    }
  } else {
    ship.setColliding(false); // Set the ship's collision status to false
  }

  ship.move(deltaTime); // Move the ship
  ship.update(deltaTime); // Update the ship's state
  ship.display(); // Draw the ship

  removeBarriers(); // Remove barriers that are no longer needed

  // Display game information (missiles, player name, score, and lives)
  textSize(20);
  textAlign(CENTER, CENTER);
  text("Missiles: " + ship.getMissileCount(), width / 2 - 250, 30);
  text("Player: " + player.getName(), width / 2 - 100, 30);
  text("Score: " + player.getScore(), width / 2 + 100, 30);
  text("Lives: " + player.getLives(), width / 2 + 250, 30);
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
