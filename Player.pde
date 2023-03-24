public class Player {
  private String name;
  private int score;
  private int lives;

  public Player(String name, int initialLives) {
    setName(name);
    setScore(0);
    setLives(initialLives);
  }

  public void loseLife() {
    if (this.lives != 0) {
      this.lives--;
    }
  }

  public void gainLife() {
    this.lives++;
  }

  public void addScore(int score) {
    this.score += score;
  }

  /*********************/
  /* Getters & Setters */
  /*********************/

  public void setName(String name) {
    this.name = name;
  }

  public void setScore(int score) {
    this.score = score;
  }

  public void setLives(int lives) {
    this.lives = lives;
  }

  public String getName() {
    return this.name;
  }

  public int getScore() {
    return this.score;
  }

  public int getLives() {
    return this.lives;
  }
}
