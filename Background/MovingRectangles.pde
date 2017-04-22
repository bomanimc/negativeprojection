class MovingRectangles {
  PGraphics mainCanvas;
  int y;
  
  int increment = 0;
  
  MovingRectangles(PGraphics canvas, int initialY) {
    mainCanvas = canvas;
    y = initialY;
  }
  
  void displayRectangle() { 
    //Display the text
    mainCanvas.fill(255, 255, 255);
    mainCanvas.rect(0, y+increment, width, 50);
    y = (y + 1) % height;
  }
} 