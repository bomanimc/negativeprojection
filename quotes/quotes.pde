import java.util.*;
import gifAnimation.*;
ContentManager cm;
RandomGif rg;

void setup() {
  size(600, 600, JAVA2D);
  background(0);
  frameRate(100);
  
  PFont VCR = createFont("VCR_OSD_MONO.ttf", 32);
  textFont(VCR);
  
  cm = new ContentManager(this);
  rg = new RandomGif(this);
}

void draw() {
  background(0);
  cm.displayContent();
  //rg.display();
}

void keyPressed() {
  cm.swapQuote();
}