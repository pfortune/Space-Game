// Import JOptionPane for input dialogs
import javax.swing.JOptionPane;

// Declare objects for the game
KeyHandler keyHandler;
Barrier[] barriers;
Player player;
Ship ship;

float barrierHeight;
float lastBarrierSpawnTime;
float lastDrawTime;
int spawnInterval = 30000; // Time between new barriers (milliseconds)

void setup() {
  size(1280, 720); // Set game window sise
  noStroke(); // Don't draw outlines for shapes
  lastDrawTime = millis(); // Save current time in milliseconds
  barrierHeight = 10;
  barriers = new Barrier[0]; // Make an empty array of barriers
  lastBarrierSpawnTime = -spawnInterval; // Start by spawning a barrier immediately
  keyHandler = new KeyHandler(); // Make a KeyHandler object for keyboard input
  ship = new Ship(keyHandler); // Make a Ship object and give it the keyHandler

  // Ask the player for their name
  String playerName = JOptionPane.showInputDialog(null, "Enter your name:", "Player Name", JOptionPane.QUESTION_MESSAGE);
  // If no name or empty name, use a default name
  if (playerName == null || playerName.trim().isEmpty()) {
    playerName = "Player1";
  }

  // Make a Player object with the name and 3 lives
  player = new Player(playerName.trim(), 3);
}


void draw() {
  // Set the background colour to black
  background(0);

  // Calculate the time elapsed since the last draw call
  float deltaTime = (millis() - lastDrawTime)/1000;
  lastDrawTime = millis();

  // Spawn a new barrier if it's time to spawn one
  if (millis() - lastBarrierSpawnTime >= spawnInterval) {
    addBarrier(new Barrier());
    lastBarrierSpawnTime = millis();
  }

  // Initialise a flag for checking if the ship is colliding with any barriers
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
    if (!ship.isInCollision()) {
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


// Add a new barrier to the barriers array
public void addBarrier(Barrier b) {
  // Create a new array with one more element
  Barrier[] newArray = new Barrier[barriers.length+1];
  // Copy the old barriers array into the new array
  arrayCopy(barriers, newArray);
  // Add the new barrier to the end of the new array
  newArray[barriers.length] = b;
  // Set the new array as the barriers array
  barriers = newArray;
}

// Remove barriers that are no longer visible on the screen
private void removeBarriers() {
  // Loop through each barrier in the barriers array
  for (int i = 0; i < barriers.length; i++) {
    Barrier b = barriers[i];
    // If the barrier's Y position is greater than or equal to the screen height
    if (b.getY() >= height) {
      // Print the index of the barrier that's no longer visible
      System.out.println("Barriers no longer visible on screen: " + i);
      // Remove the barrier from the barriers array
      barriers = removeFromArray(barriers, i);
      // Decrement the index to account for the removed item
      i--;
    }
  }
}

// Remove a barrier from the barriers array by index
private Barrier[] removeFromArray(Barrier[] array, int index) {
  // Create a new array with one less element
  Barrier[] newArray = new Barrier[array.length - 1];
  // Copy all elements from the original array to the new array, skipping the one to be removed
  for (int i = 0, j = 0; i < array.length; i++) {
    if (i == index) {
      continue;
    }
    newArray[j++] = array[i];
  }
  // Return the new array
  return newArray;
}

// Detect when keys are pressed and update the keyHandler object
public void keyPressed() {
  // Check for each key and update the keyHandler accordingly
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

// Detect when keys are released and update the keyHandler object
public void keyReleased() {
  // Check for each key and update the keyHandler accordingly
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
