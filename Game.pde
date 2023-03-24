// Import JOptionPane for input dialogs
import javax.swing.JOptionPane;

// Declare objects for the game
KeyHandler keyHandler;
Barrier[] barriers;
Pickup[] pickups;
Player player;
Ship ship;
Button resetButton;
Button continueButton;
Scoreboard scoreboard;
Enemy[] aliens;

float barrierHeight;
float boxSize = 400;
float lastBarrierSpawnTime;
float lastAlienSpawnTime;
float alienSpawnInterval = 5000;
float lastDrawTime;
int spawnInterval = 30000; // Time between new barriers (milliseconds)
boolean isPaused = false;
boolean scoreUpdated = false;

void setup() {
  size(1280, 720); // Set game window sise
  noStroke(); // Don't draw outlines for shapes
  lastDrawTime = millis(); // Save current time in milliseconds
  barrierHeight = 10;
  barriers = new Barrier[0]; // Make an empty array of barriers

  lastBarrierSpawnTime = -spawnInterval; // Start by spawning a barrier immediately
  keyHandler = new KeyHandler(); // Make a KeyHandler object for keyboard input
  ship = new Ship(keyHandler); // Make a Ship object and give it the keyHandler
  scoreboard = new Scoreboard(10);
  aliens = new Enemy[0];
  pickups = new Pickup[0];

  // Ask the player for their name
  String playerName = JOptionPane.showInputDialog(null, "Enter your name:", "Player Name", JOptionPane.QUESTION_MESSAGE);
  // If no name or empty name, use a default name
  if (playerName == null || playerName.trim().isEmpty()) {
    playerName = "Player1";
  }

  // Make a Player object with the name and 3 lives
  player = new Player(playerName.trim(), 3);

  //public Button(float x, float y, float w, float h, String text, color colour) {

  resetButton = new Button((width / 2) - (boxSize / 2), height / 2, boxSize, boxSize/5, "RESET", color(255, 100, 100));
  continueButton = new Button((width / 2) - (boxSize / 2), (height / 2) + (boxSize / 4), boxSize, boxSize/5, "CONTINUE", color(0, 255, 0));
}

void draw() {
  // Set the background colour to black
  background(0);


  if (player.getLives() == 0) {
    if (scoreUpdated == false) {
      scoreboard.update(player.getName(), player.getScore());
      scoreUpdated = true;
    }
    showGameOverMenu();
    return;
  }

  if (keyHandler.isPaused()) {
    isPaused = !isPaused;
    keyHandler.setPaused(false);
  }

  if (isPaused) {
    showPauseMenu();
  } else {
    // Calculate the time elapsed since the last draw call
    float deltaTime = (millis() - lastDrawTime)/1000;
    lastDrawTime = millis();
    //println(lastBarrierSpawnTime);
    // Spawn a new barrier if it's time to spawn one
    if (millis() - lastBarrierSpawnTime >= spawnInterval) {
      addBarrier(new Barrier());
      lastBarrierSpawnTime = millis();
      println("add barrier");
    }

    // Spawn a new alien if it's time to spawn one
    if (millis() - lastAlienSpawnTime >= alienSpawnInterval) {
      float x = random(20, width - 20);
      Enemy aliens = new Enemy(x, 0, 1);
      addAlien(aliens);
      lastAlienSpawnTime = millis();
    }

    // Initialise a flag for checking if the ship is colliding with any barriers
    boolean isCollidingWithBarrier = false;
    // Initialise a flag for checking if the ship is going through any gaps
    //boolean isGoingThrough?Gap = false;

    // Loop through all barriers
    for (int i = 0; i < barriers.length; i++) {
      if (barriers[i] == null) {
        continue; // Skip if the barrier is null (removed)
      }

      Barrier b = barriers[i];
      b.update(deltaTime); // Update barrier state
      b.display(); // Draw the barrier

      // Check if the ship is colliding with the current barrier
      if (b.collisionCheck(ship.getBoundingBox())) {
        println("ship collided with barrier");
        isCollidingWithBarrier = true;
      }

      /********************************************
       *   Barrier & Missile Collision Detection  *
       ********************************************/
      for (int j=0; j<ship.getMissiles().length; j++) {
        Missile m = ship.getMissile(j);

        if (m.getBoundingBox() == null) {
          continue;
        }

        if (b.collisionCheck(m.getBoundingBox())) {
          b.collided(m.getX(), m.getPayload());
          m.explode();
        }
      }
    }

    /********************************************
     *     Gap & Ship Collision Detection       *
     ********************************************/


    if (isCollidingWithBarrier) {
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


    /********************************************
     *      Aliens/Ship Collision Detection     *
     ********************************************/

    // Update and display all aliens
    for (int i = 0; i < aliens.length; i++) {
      aliens[i].update(ship);
      aliens[i].display();

      if (aliens[i] == null) {
        break;
      }

      if (aliens[i].readyForCleanup()) {
        aliens = removeAlien(aliens, i);
      }

      if (!aliens[i].isDead() && ship.getBoundingBox().hasCollided(aliens[i].getBoundingBox())) {
        aliens[i].setDead(true);
        player.loseLife(); // Reduce player's lives
        ship.respawn();
      }
    }

    /**********************************************
     *   Aliens/Ship Missile Collision Detection  *
     **********************************************/
    for (int i = 0; i < ship.getMissiles().length; i++) {
      Missile m = ship.getMissile(i);

      if (m.getBoundingBox() == null) {
        continue;
      }

      // Check for collision between the current missile and all alien ships
      for (int j = 0; j < aliens.length; j++) {
        if (!aliens[j].isDead() && m.getBoundingBox().hasCollided(aliens[j].getBoundingBox())) {
          //Increase player score
          player.addScore(2);
          spawnInterval -= spawnInterval/10;
          m.explode();
          addPickup(new Pickup(aliens[j].getX(), aliens[j].getY()));
          // Remove the alien ship from the game
          aliens[j].setDead(true);
          break;
        }
      }
    }

    for (int i = 0; i < pickups.length; i++) {
      pickups[i].update();
      pickups[i].display();
    }

    /*********************************************
     *   Ship/Alien Missile Collision Detection  *
     *********************************************/
    for (int i = 0; i < aliens.length; i++) {
      for (int j = 0; j < aliens[i].getMissiles().length; j++) {
        Missile m = aliens[i].getMissile(j);

        if (m.getBoundingBox() == null) {
          continue;
        }

        if (m.getBoundingBox().hasCollided(ship.getBoundingBox())) {
          // Decrease player's lives or health
          player.loseLife();
          m.explode();
          ship.respawn();

          break;
        }
      }
    }

    /********************************************
     *    Ship & Pickup Collision Detection      *
     ********************************************/

    for (int i = 0; i < pickups.length; i++) {
      if (pickups[i] == null) {
        continue;
      }
      if (ship.getBoundingBox().hasCollided(pickups[i].getBoundingBox())) {
        ship.increaseMissileCount(int(random(1, 5)));

        pickups = removePickup(pickups, i);
        continue;
      }
      for (int j=0; j<barriers.length; j++ ) {
        if (barriers[j] == null) {
          continue;
        }
        Barrier b = barriers[j];

        if (b.collisionCheck(pickups[i].getBoundingBox())) {
          pickups = removePickup(pickups, i);
          break;
        }
      }
    }


    removeBarriers();
  }
}

public void resetGame() {
  barriers = new Barrier[0];
  aliens = new Enemy[0];
  player.setLives(3);
  ship.setX(width/2);
  ship.setY(height-45);
  ship.setMissile(10);
  player.setScore(0);
  pickups = new Pickup[0];
  spawnInterval = 30000; // Reset the spawn interval
  lastBarrierSpawnTime = -spawnInterval; // spawn barrier immediately
  scoreUpdated = false;
}

public void showGameOverMenu() {
  fill(255);
  rect((width / 2) - boxSize, (height / 2) - (boxSize / 2), boxSize * 2, boxSize);
  fill(0);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("GAME OVER", width/2, height/4);
  scoreboard.display(int((width / 2) - (boxSize / 2)), int(height / 2));
  resetButton.display();
}

public void showPauseMenu() {
  fill(255);
  rect((width / 2) - boxSize, (height / 2) - (boxSize / 2), boxSize * 2, boxSize);
  fill(100, 100, 100);
  textSize(80);
  textAlign(CENTER, CENTER);
  text("PAUSED", width/2, (height/2)- boxSize/4);

  textSize(40);
  resetButton.display();
  continueButton.display();
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



// Add a new picku
public void addPickup(Pickup p) {
  // Create a new array with one more element
  Pickup[] newArray = new Pickup[pickups.length+1];
  // Copy the old pickup array into the new array
  arrayCopy(pickups, newArray);
  // Add the new pickup to the end of the new array
  newArray[pickups.length] = p;
  // Set the new array as the pickups array
  pickups = newArray;
}

// Add a new alien
public void addAlien(Enemy e) {
  // Create a new array with one more element
  Enemy[] newArray = new Enemy[aliens.length+1];
  // Copy the old enemies array into the new array
  arrayCopy(aliens, newArray);
  // Add the new enemy to the end of the new array
  newArray[aliens.length] = e;
  // Set the new array as the enemies array
  aliens = newArray;
}

public Enemy[] removeAlien(Enemy[] aliens, int index) {
  Enemy[] newArray = new Enemy[aliens.length - 1];

  for (int i = 0, j = 0; i < aliens.length; i++) {
    if (i != index) {
      newArray[j++] = aliens[i];
    }
  }

  return newArray;
}

public Pickup[] removePickup(Pickup[] pickups, int index) {
  Pickup[] newArray = new Pickup[pickups.length - 1];

  for (int i = 0, j = 0; i < pickups.length; i++) {
    if (i != index) {
      newArray[j++] = pickups[i];
    }
  }

  return newArray;
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

void mousePressed() {
  if (isPaused || player.getLives() == 0) {
    if (resetButton.handleClick(mouseX, mouseY)) {
      resetGame();
      isPaused = false;
    }
    if (continueButton.handleClick(mouseX, mouseY)) {
      isPaused = false;
    }
  }
}
