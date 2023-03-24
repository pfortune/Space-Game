class Scoreboard {
  private int maxSize;
  private int[] scores;
  private String[] playerNames;

  public Scoreboard(int maxSize) {
    scores = new int[maxSize];
    playerNames = new String[maxSize];
    this.maxSize = maxSize;
    // Initialise with demo values, like a traditional arcade
    for (int i = 0; i < maxSize; i++) {
      playerNames[i] = "Demo";
      scores[i] = 0;
    }
  }

public void update(String playerName, int score) {
  int newIndex = -1;

  for (int i = 0; i < maxSize; i++) {
    if (playerNames[i] == null || scores[i] < score) {
      newIndex = i;
      break;
    }
  }

  if (newIndex != -1) {
    // Shift all elements after the newIndex one position to the right
    for (int i = maxSize - 1; i > newIndex; i--) {
      playerNames[i] = playerNames[i - 1];
      scores[i] = scores[i - 1];
    }

    // Insert the new playerName and score at newIndex
    playerNames[newIndex] = playerName;
    scores[newIndex] = score;
  }
}


  public void display(int x, int y) {
    textSize(14);
    fill(150, 150, 150);

    for (int i=0; i < maxSize; i++) {
      println("Rank: " + (i+1) + ", Score: " + scores[i] + ", Player: " + playerNames[i]);
    }
  }
}
