import java.util.*;
import gifAnimation.*;
import codeanticode.syphon.*;
import de.voidplus.leapmotion.*;

LeapMotion leap;
PGraphics canvas;
SyphonServer server;
float handGrab;

MovingRectangles rect1, rect2, rect3, rect4, rect5;

int movement = 0;

void settings() {
  size(600, 600, P3D);
  PJOGL.profile = 1;
}

void setup() {
  canvas = createGraphics(600, 600, P3D);
  server = new SyphonServer(this, "Processing Syphon Server");
  leap = new LeapMotion(this).allowGestures();
  
  frameRate(100);
  
  rect1 = new MovingRectangles(canvas, 0);
  rect2 = new MovingRectangles(canvas, 150);
  rect3 = new MovingRectangles(canvas, 300);
  rect4 = new MovingRectangles(canvas, 450);
  rect5 = new MovingRectangles(canvas, 600);
}

void draw() {
  for (Hand hand : leap.getHands()) {
    handGrab = hand.getGrabStrength();
  }
  
  if (handGrab == 1) {
    rect1.hide();
    rect2.hide();
    rect3.hide();
    rect4.hide();
    rect5.hide();  
  }
  else {
    rect1.unhide();
    rect2.unhide();
    rect3.unhide();
    rect4.unhide();
    rect5.unhide();
  }
  
  canvas.beginDraw();
  canvas.background(0);
  
  rect1.displayRectangle();
  rect2.displayRectangle();
  rect3.displayRectangle();
  rect4.displayRectangle();
  rect5.displayRectangle();
  
  canvas.endDraw();
  image(canvas, 0, 0);
  server.sendImage(canvas);
  
  movement = (movement + 1) % height;
}