class MovingRectangles {
  PGraphics mainCanvas;
  int y;
  color c = #ffffff;
  int increment = 0;
  
  MovingRectangles(PGraphics canvas, int initialY) {
    mainCanvas = canvas;
    y = initialY;
  }
  
  void displayRectangle() { 
    //Display the text
    mainCanvas.fill(c);
    mainCanvas.rect(0, y+increment, width, 50);
    y = (y + 1) % height;
  }
  
  void hide() {
    c = #000000;
  }
  
  void unhide() {
    c = #ffffff;
  }
} 