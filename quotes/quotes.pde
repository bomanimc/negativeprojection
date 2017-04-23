import java.util.*;
import gifAnimation.*;
import codeanticode.syphon.*;
import http.requests.*;

PGraphics canvas;
SyphonServer server;
int handState;

ContentManager cm;

void settings() {
  size(600, 600, P3D);
  PJOGL.profile = 1;
}

void setup() {
  canvas = createGraphics(600, 600, P3D);
  server = new SyphonServer(this, "Processing Syphon Server");
  cm = new ContentManager(this, canvas);
  
  frameRate(100); 
}

void draw() {  
  if (handState == 1) {
    cm.swapQuote();
  }
  
  if (frameCount % 5 == 0) {
    GetRequest get = new GetRequest("http://localhost:3000/grip");
    get.send();
    JSONObject response = parseJSONObject(get.getContent()); 
    handState = response.getInt("handState");
  }
  
  canvas.beginDraw();
  canvas.background(0);
  
  cm.displayContent();
  
  canvas.endDraw();
  image(canvas, 0, 0);
  server.sendImage(canvas);
}