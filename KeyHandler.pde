public class KeyHandler {
  // Declare instance variables for key states
  private boolean left, right, up, down, space, paused;

  // Constructor for KeyHandler class
  public KeyHandler() {
    // Initialise all key states to false (not pressed)
    setLeft(false);
    setRight(false);
    setUp(false);
    setDown(false);
    setSpace(false);
    setPaused(false);
  }

  public void handleDown(char keyName, int keyID) {
    // Check for each key and update the keyHandler accordingly
    if (keyName == 'a' || keyName == 'A' || keyID == LEFT) {
      keyHandler.setLeft(true);
    }
    if (keyName == 'd' || keyName == 'D' || keyID == RIGHT) {
      keyHandler.setRight(true);
    }
    if (keyName == 'w' || keyName == 'W' || keyID == UP) {
      keyHandler.setUp(true);
    }
    if (keyName == 's' || keyName == 'S' || keyID == DOWN) {
      keyHandler.setDown(true);
    }
    if (keyName == ' ' || keyID == 32) {
      keyHandler.setSpace(true);
    }
    if (keyID == BACKSPACE) {
      keyHandler.setPaused(true);
    }
  }

  public void handleUp(char keyName, int keyID) {
    // Check for each key and update the keyHandler accordingly
    if (keyName == 'a' ||keyName == 'A' || keyID == LEFT) {
      keyHandler.setLeft(false);
    }
    if (keyName == 'd' || keyName == 'D' || keyID == RIGHT) {
      keyHandler.setRight(false);
    }
    if (keyName == 'w' || keyName == 'W' || keyID == UP) {
      keyHandler.setUp(false);
    }
    if (keyName == 's' || keyName == 'S' || keyID == DOWN) {
      keyHandler.setDown(false);
    }
    if (keyName == ' ' || keyID == 32) {
      keyHandler.setSpace(false);
    }
  }
  
  public void mouseClicked() {
    
  }

  /*********************/
  /* Getters & Setters */
  /*********************/

  public void setLeft(boolean state) {
    this.left = state;
  }

  public void setPaused(boolean state) {
    this.paused = state;
  }

  public void setRight(boolean state) {
    this.right = state;
  }

  public void setUp(boolean state) {
    this.up = state;
  }

  public void setDown(boolean state) {
    this.down = state;
  }

  public void setSpace(boolean state) {
    this.space = state;
  }

  public boolean isSpace() {
    return this.space;
  }

  public boolean isLeft() {
    return this.left;
  }

  public boolean isRight() {
    return this.right;
  }

  public boolean isUp() {
    return this.up;
  }

  public boolean isDown() {
    return this.down;
  }
  
  public boolean isPaused() {
    return this.paused;
  }
}
