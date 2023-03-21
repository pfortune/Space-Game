// Import JOptionPane for input dialogs
import javax.swing.JOptionPane;

// Declare objects for the game
KeyHandler keyHandler;
Barrier[] barriers;
Gap[] gap;
Player player;
Ship ship;
Button button;
Enemy alien;

float barrierHeight;
float lastBarrierSpawnTime;
float lastDrawTime;
int spawnInterval = 30000; // Time between new barriers (milliseconds)
boolean isPaused = false;

void setup() {
  size(1280, 720); // Set game window sise
  noStroke(); // Don't draw outlines for shapes
  lastDrawTime = millis(); // Save current time in milliseconds
  barrierHeight = 10;
  barriers = new Barrier[0]; // Make an empty array of barriers
  gap = new Gap[0];
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
  alien = new Enemy(200, 200, 2);
}


void draw() {
  // Set the background colour to black
  background(0);

  if (keyHandler.isPaused()) {
    isPaused = !isPaused;
    keyHandler.setPaused(false);
  }

  if (isPaused) {
    showMenu();
  } else {
    // Calculate the time elapsed since the last draw call
    float deltaTime = (millis() - lastDrawTime)/1000;
    lastDrawTime = millis();

    // Spawn a new barrier if it's time to spawn one
    if (millis() - lastBarrierSpawnTime >= spawnInterval) {
      addBarrier(new Barrier());
      lastBarrierSpawnTime = millis();
    }

    // Initialise a flag for checking if the ship is colliding with any barriers
    boolean isCollidingWithBarrier = false;
    // Initialise a flag for checking if the ship is going through any gaps
    boolean isGoingThroughGap = false;

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
        isCollidingWithBarrier = true;
      }


      for (int j=0; j<ship.getMissiles().length; j++) {
        Missile m = ship.getMissile(j);

        if (m.getBoundingBox() == null) {
          continue;
        }

        if (m.getBoundingBox().hasCollided(b.getBoundingBox())) {
          b.collided(m.getX(), m.getPayload());
          addGap(new Gap(m.getX()-ship.getWidth(), b.getY()-5, ship.getWidth()*2, b.getHeight()*2, b.getSpeed()));
          m.explode();
        }
      }
    }

    // Checking if the ship has collided with a gap
    for (int k=0; k<gap.length; k++) {
      if (gap[k] == null) {
        continue; // Skip if the barrier is null (removed)
      }

      Gap g = gap[k];
      g.update(deltaTime);
      g.display();

      // Check if the ship is colliding with a gap
      if (g.getBoundingBox().hasCollided(ship.getBoundingBox())) {
        isGoingThroughGap = true;
      }
    }

    // If the ship is colliding with any barriers
    if (isGoingThroughGap) {
      ship.setColliding(false); // Set the ship's collision status to false
    } else if (isCollidingWithBarrier) {
      if (!ship.isInCollision()) {
        player.loseLife(); // Reduce player's lives
        ship.respawn();
        ship.setColliding(true); // Set the ship's collision status to true
      }
    } else {
      ship.setColliding(false);
    }

    ship.move(deltaTime); // Move the ship
    ship.update(deltaTime); // Update the ship's state
    ship.display(); // Draw the ship

    //scoreboard.update();
    //scoreboard.display();

    displayStats();
  }

  if (player.getLives() == 0) {
    endGame();
  }

  removeBarriers();
  alien.update(ship);
  alien.display();
  
  if (alien.getBoundingBox().hasCollided(ship.getBoundingBox())) {
    // Handle collision here (e.g., reduce player's lives, end the game, etc.)
    println("Spaceship collided with alien ship!");
  }
}

public void endGame() {
  background(0);
  fill(255, 125, 125);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("GAME OVER", width/2, height/2);
}

public void resetGame() {
  barriers = new Barrier[0];
  player.setLives(3);
  ship.setX(width/2);
  ship.setY(height-45);
  ship.setMissile(10);
  player.setScore(0);
  lastBarrierSpawnTime = -spawnInterval;
}

public void showMenu() {
}

public void displayStats() {
  // Display game information (missiles, player name, score, and lives)
  fill(255, 125, 125);
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

// Add a new gap to a barrier
public void addGap(Gap g) {
  // Create a new array with one more element
  Gap[] newArray = new Gap[gap.length+1];
  // Copy the old barriers array into the new array
  arrayCopy(gap, newArray);
  // Add the new barrier to the end of the new array
  newArray[gap.length] = g;
  // Set the new array as the barriers array
  gap = newArray;
}

// Remove barriers that are no longer visible on the screen
private void removeBarriers() {
  // Loop through each barrier in the barriers array
  for (int i = 0; i < barriers.length; i++) {
    Barrier b = barriers[i];
    // If the barrier's Y position is greater than or equal to the screen height
    if (b.getY() >= height) {
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
  keyHandler.handleDown(key, keyCode);
}

// Detect when keys are released and update the keyHandler object
public void keyReleased() {
  keyHandler.handleUp(key, keyCode);
}
