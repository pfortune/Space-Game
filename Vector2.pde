public class Vector2 {
  private float x, y;

  public Vector2() {
    x = y = 0; // Initialise x and y to 0
  }

  public Vector2(float x, float y) {
    this.x = x;
    this.y = y;
  }

  /**
   * Normalizes the vector from the first point (x1, y1) to the second point (x2, y2).
   * The resulting vector has a length of 1, and points in the same direction as the original vector.
   */
  public void normalizeFrom(float x1, float y1, float x2, float y2) {
    // Calculate the distance between the two points using the dist() method
    float distance = dist(x1, y1, x2, y2);

    // Calculate the normalised vector
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
