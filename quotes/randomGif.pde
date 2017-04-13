class RandomGif {
  Gif chosenGif;
  PImage[] allFrames;
  int frame;
  
  RandomGif(quotes applet) {
    //Put the file name of the gif as the second argument.
    //chosenGif = new Gif(applet, "quote-1.gif");
    //chosenGif.loop();
    allFrames = Gif.getPImages(applet, "quote-1.gif");
    frame = 0;
  }
  
  void display() {
    //Set the background color   
    background(0);
    
    //Change the GIF to fit inside the image
    //chosenGif.resize(width, height);
    
    //Position the image
    //image(chosenGif, 0, 0);
    frame = frame % allFrames.length;
    image(allFrames[frame], 0, 0, width, height);
    frame += 1;
  }
  
}