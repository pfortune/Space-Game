public class KeyHandler {
  private boolean left, right, up, down;

  public KeyHandler() {
    setLeft(false);
    setRight(false);
    setUp(false);
    setDown(false);
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
