public class KeyHandler {
  // Declare instance variables for key states
  private boolean left, right, up, down, space;

  // Constructor for KeyHandler class
  public KeyHandler() {
    // Initialize all key states to false (not pressed)
    setLeft(false);
    setRight(false);
    setUp(false);
    setDown(false);
    setSpace(false);
  }

  /*********************/
  /* Getters & Setters */
  /*********************/

  public void setLeft(boolean state) {
    this.left = state;
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
}
