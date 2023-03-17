public class Player {
  private String name;
  private int score;
  private int lives;

  public Player(String name, int initialLives) {
    this.name = name;
    this.score = 0;
    this.lives = initialLives;
  }

  public String getName() {
    return this.name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getScore() {
    return this.score;
  }

  public void setScore(int score) {
    this.score = score;
  }

  public void addScore(int score) {
    this.score += score;
  }

  public int getLives() {
    return this.lives;
  }

  public void setLives(int lives) {
    this.lives = lives;
  }

  public void loseLife() {
    this.lives--;
  }

  public void gainLife() {
    this.lives++;
  }
}
