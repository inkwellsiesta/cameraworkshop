PImage img, img_flip;
boolean flip;

void setup() {
  size(750, 750);
  img = loadImage("spaceship.png");
  img_flip = createImage(750, 750, RGB);
  
  img.loadPixels();
  img_flip.loadPixels();
  
  for (int i = 0; i < img.width; i++) {
    for (int j = 0; j < img.height; j++) {
      img_flip.set(i, img_flip.height-1-j, img.get(i, j)); 
    }
  }
  
  img_flip.updatePixels();
  
  flip = false;
}

void draw() {
  background(0);
  
  if (flip) {
    image(img_flip,0,0);
  }
  else {
    image(img,0,0);
  }
}

void mouseClicked() {
  flip = !flip;
}