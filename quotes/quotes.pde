import java.util.*;
import gifAnimation.*;
import codeanticode.syphon.*;
import de.voidplus.leapmotion.*;

LeapMotion leap;
PGraphics canvas;
SyphonServer server;
float handGrab;

ContentManager cm;

void settings() {
  size(600, 600, P3D);
  PJOGL.profile = 1;
}

void setup() {
  canvas = createGraphics(600, 600, P3D);
  server = new SyphonServer(this, "Processing Syphon Server");
  leap = new LeapMotion(this).allowGestures();
  cm = new ContentManager(this, canvas);
  
  frameRate(100); 
}

void draw() {
  int fps = leap.getFrameRate();
  for (Hand hand : leap.getHands()) {
    handGrab = hand.getGrabStrength();
  }
  
  if (handGrab == 1) {
    cm.swapQuote();
  }
  
  canvas.beginDraw();
  canvas.background(0);
  
  cm.displayContent();
  
  canvas.endDraw();
  image(canvas, 0, 0);
  server.sendImage(canvas);
}

void leapOnInit() {
  //println("Leap Motion Init");
}
void leapOnConnect() {
  println("Leap Motion Connect");
}
void leapOnFrame() {
  //println("Leap Motion Frame");
}
void leapOnDisconnect() {
  println("Leap Motion Disconnect");
}
void leapOnExit() {
  //println("Leap Motion Exit");
}