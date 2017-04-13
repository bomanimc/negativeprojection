import java.util.*;
import gifAnimation.*;
import codeanticode.syphon.*;

PGraphics canvas;
SyphonServer server;

ContentManager cm;

void settings() {
  size(600, 600, P3D);
  PJOGL.profile = 1;
}

void setup() {
  canvas = createGraphics(600, 600, P3D);
  server = new SyphonServer(this, "Processing Syphon Server");
 
  frameRate(100);
  
  cm = new ContentManager(this, canvas);
}

void draw() {
  canvas.beginDraw();
  canvas.background(0);
  
  cm.displayContent();
  
  canvas.endDraw();
  image(canvas, 0, 0);
  server.sendImage(canvas);
}

void keyPressed() {
  cm.swapQuote();
}