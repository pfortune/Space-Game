class Button {
  private float x, y, w, h;
  private String text;
  private color colour;
  private boolean pressed, clicked;

  public Button(float x, float y, float w, float h, String text, color colour) {
    setX(x);
    setY(y);
    setWidth(w);
    setHeight(h);
    setText(text);
    setColour(colour);
    setPressed(false);
    setClicked(false);
  }

  public void update(int y) {
    setY(y);
  }

  public void update(int x, int y, int w, int h) {
    setX(x);
    setY(y);
    setWidth(w);
    setHeight(h);
  }

  public void display() {
    fill(colour);
    rect(x, y, w, h);
    fill(0);
    textAlign(CENTER, CENTER);
    text(text, x + w / 2, y + h / 2);
  }

  public boolean handleClick(float x, float y) {
    if (x > this.x && x < this.x + this.w && y > this.y && y < this.y + this.h) {
      return true;
    }
    return false;
  }

  /*********************/
  /* Getters & Setters */
  /*********************/

  public void setX(float x) {
    this.x = x;
  }

  public float getX() {
    return this.x;
  }

  public void setY(float y) {
    this.y = y;
  }

  public float getY() {
    return this.y;
  }

  public void setWidth(float w) {
    this.w = w;
  }

  public float getWidth() {
    return this.w;
  }

  public void setHeight(float h) {
    this.h = h;
  }

  public float getHeight() {
    return this.h;
  }

  public void setText(String text) {
    this.text = text;
  }

  public String getText() {
    return this.text;
  }

  public void setColour(color colour) {
    this.colour = colour;
  }

  public color getColour() {
    return this.colour;
  }

  public void setPressed(boolean state) {
    this.pressed = state;
  }

  public boolean getPressed() {
    return this.pressed;
  }

  public void setClicked(boolean state) {
    this.clicked = state;
  }

  public boolean getClicked() {
    return this.clicked;
  }
}
