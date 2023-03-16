public class PuffBall {
  private int duration;
  private float startRadius, endRadius, currentRadius;
  private float x, y;
  private float spawnedAt;
  private color startColour, endColour, currentColour;

  public PuffBall(int duration, float startRadius, float endRadius, float x, float y, color startColour, color endColour) {
    setDuration(duration);
    setStartRadius(startRadius);
    setEndRadius(endRadius);
    setX(x);
    setY(y);
    setStartColour(startColour);
    setEndColour(endColour);
    this.spawnedAt = millis();
  }

  public void update() {
    float livedFor = millis() - spawnedAt;
    float percentComplete = livedFor / duration;

    setCurrentColour(lerpColor(getStartColour(), getEndColour(), percentComplete));
    setCurrentRadius(lerp(getStartRadius(), getEndRadius(), percentComplete));
  }

  public void display() {
    if ((millis() - spawnedAt) >= duration) {
      return;
    }

    fill(getCurrentColour());
    circle(getX(), getY(), getCurrentRadius());
  }

  public int getDuration() {
    return duration;
  }

  public void setDuration(int duration) {
    this.duration = duration;
  }

  public float getStartRadius() {
    return startRadius;
  }

  public void setStartRadius(float startRadius) {
    this.startRadius = startRadius;
  }

  public float getEndRadius() {
    return endRadius;
  }

  public void setEndRadius(float endRadius) {
    this.endRadius = endRadius;
  }

  public float getCurrentRadius() {
    return currentRadius;
  }

  public void setCurrentRadius(float currentRadius) {
    this.currentRadius = currentRadius;
  }

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

  public color getStartColour() {
    return startColour;
  }

  public void setStartColour(color startColour) {
    this.startColour = startColour;
  }

  public color getEndColour() {
    return endColour;
  }

  public void setEndColour(color endColour) {
    this.endColour = endColour;
  }

  public color getCurrentColour() {
    return currentColour;
  }

  public void setCurrentColour(color currentColour) {
    this.currentColour = currentColour;
  }
}
