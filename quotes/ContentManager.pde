class ContentManager {
  PImage[] allFrames;
  PGraphics mainCanvas;
  PFont VCR;
  
  int frame;
  quotes mainApplet;
  
  Boolean value = true;
  int countSinceSwap = 0;
  int quotesIndex = 0;
  int amountOfGifs = 12;
  
  String[] quotes = {
    "I'm not good enough. I shouldn't be here.",
    "I'm not important enough to be cared for.",
    "I'm not passionate about all the things I used to be into.",
    "I should just stay in my lane.",
    "Why does it feel like I'm the only one without a talent?",
    "I never feel passion.",
    "I'm a waste.",
    "People use me and then throw me aside.",
    "I fuck up when people are depending on me the most."
  };

  ContentManager(quotes applet, PGraphics canvas) {
    mainApplet = applet;
    mainCanvas = canvas;
    VCR = createFont("VCR_OSD_MONO.ttf", 32);
    selectRandomGif();
  }
  
  void selectRandomGif() {
    String gifName = "quote-" + nf(int(random(1, amountOfGifs))) + ".gif";
    allFrames = Gif.getPImages(mainApplet, gifName);
  }
  
  void swapQuote() {
    frame = 0;
    countSinceSwap = 0;  
    quotesIndex = (quotesIndex + 1) % quotes.length;
    selectRandomGif();
  }
   
  void displayContent() {
    if (countSinceSwap <= 50) {
      displayGif();
    } else {
      displayText();
    }
    
    countSinceSwap += 1;
  }
  
  void displayGif() {    
    frame = frame % allFrames.length;
    mainCanvas.image(allFrames[frame], 0, 0, width, height);
    frame += 1;
  }
  
  void displayText() {
    //Set the background color   
    mainCanvas.background(0);
    
    //Display the text
    mainCanvas.textFont(VCR);
    mainCanvas.textSize(32);
    mainCanvas.fill(255, 255, 255);
    mainCanvas.text(quotes[quotesIndex], 0.15*width, 0.3*height, 0.75*width, 0.7*height);
  }
  
} 