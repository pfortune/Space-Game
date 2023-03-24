public class Vector2 {
  private float x, y;

  /**
   * Creates a new object with x and y values set to zero.
   */
  public Vector2() {
    setX(0);
    setY(0);
  }

  /**
   * Creates a new object with the given x and y values.
   */
  public Vector2(float x, float y) {
    this.x = x;
    this.y = y;
  }

  /**
   * Calculates the direction and scales it to have a length of 1, between two points.
   */
  public void normalizeFrom(float x1, float y1, float x2, float y2) {
    // Calculate the distance between the two points using the dist() method
    float distance = dist(x1, y1, x2, y2);

    // Calculate the normalised direction
    x = (x2 - x1) / distance;
    y = (y2 - y1) / distance;
  }

  /*********************/
  /* Getters & Setters */
  /*********************/

  public float getX() {
    return x;
  }

  public void setX(float x) {
    this.x = x;
  }

  public float getY() {
    return y;
  }

  public void setY(float y) {
    this.y = y;
  }
}
