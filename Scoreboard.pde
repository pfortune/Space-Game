class Scoreboard {
  private int maxSize;
  private int[] scores;
  private String[] playerNames;

  public Scoreboard(int maxSize) {
    setMaxSize(maxSize);
    scores = new int[maxSize];
    playerNames = new String[maxSize];
    // Initialise with demo values, like a traditional arcade
    for (int i = 0; i < maxSize; i++) {
      setPlayerName(i, "Demo");
      setScore(i, 0);
    }
  }

  public void update(String playerName, int score) {
    int newIndex = -1;

    for (int i = 0; i < getMaxSize(); i++) {
      if (getPlayerName(i) == null || getScore(i) < score) {
        newIndex = i;
        break;
      }
    }

    if (newIndex != -1) {
      // Shift all elements after the newIndex one position to the right
      for (int i = getMaxSize() - 1; i > newIndex; i--) {
        setPlayerName(i, getPlayerName(i - 1));
        setScore(i, getScore(i - 1));
      }

      // Insert the new playerName and score at newIndex
      setPlayerName(newIndex, playerName);
      setScore(newIndex, score);
    }
  }

  public void display(int x, int y) {
    textSize(20);
    fill(0);

    for (int i = 0; i < getMaxSize(); i++) {

      text("#" + (i + 1) + ": " + getPlayerName(i).toUpperCase() + " - Points: " + getScore(i), x, y);

      y += 26;
    }
  }

  /*********************/
  /* Getters & Setters */
  /*********************/

  public void setMaxSize(int maxSize) {
    this.maxSize = maxSize;
  }

  public void setScore(int index, int score) {
    this.scores[index] = score;
  }

  public void setPlayerName(int index, String playerName) {
    this.playerNames[index] = playerName;
  }

  public int getScore(int index) {
    return scores[index];
  }

  public int getMaxSize() {
    return maxSize;
  }

  public String getPlayerName(int index) {
    return playerNames[index];
  }
}
