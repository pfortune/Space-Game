public class KeyHandler {
  private boolean left, right, up, down;

  public KeyHandler() {
    left = false;
    right = false;
    up = false;
    down = false;
  }

  public void setLeft(boolean state) {
    left = state;
  }

  public void setRight(boolean state) {
    right = state;
  }

  public void setUp(boolean state) {
    up = state;
  }

  public void setDown(boolean state) {
    down = state;
  }

  public boolean isLeft() {
    return left;
  }

  public boolean isRight() {
    return right;
  }

  public boolean isUp() {
    return up;
  }

  public boolean isDown() {
    return down;
  }
}
