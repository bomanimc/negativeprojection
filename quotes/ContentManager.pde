class ContentManager {
  PImage[] allFrames;
  int frame;
  
  Boolean value = true;
  String s1 = "This is a test of using text";
  String s2 = "A different test of using text";
  int countSinceSwap = 0;

  ContentManager(quotes applet) {
    allFrames = Gif.getPImages(applet, "quote-1.gif");
  }
  
  void swapQuote() {
    frame = 0;
    countSinceSwap = 0;
  }
  
  void displayContent() {
    if (countSinceSwap <= 100) {
      displayGif();
    } else {
      displayText();
    }
    
    countSinceSwap += 1;
  }
  
  void displayGif() {    
    frame = frame % allFrames.length;
    image(allFrames[frame], 0, 0, width, height);
    frame += 1;
  }
  
  void displayText() {
    //Set the background color   
    background(0);
    
    //Display the text
    textSize(32);
    fill(255, 255, 255);
    text(s1, 100, 100, 500, 500);
  }
  
} 