PImage img, msk;
boolean vignette;

void setup() {
  size(460, 460);
  img = loadImage("inky.png");
  msk = createImage(460, 460, RGB);
  
  msk.loadPixels();
  for (int i = 0; i < msk.width; i++) {
    for (int j = 0; j < msk.height; j++) {
        msk.set(i, j, color(255, 255, 255 - dist(i, j, width/2, height/2)));
    }
  }
  msk.updatePixels();
  
  vignette = false;
}

void draw() {
  background(0);
  image(img, 0, 0);
}

void mouseClicked() {
  vignette = !vignette;
  if (vignette) {
    img.mask(msk);
  }
  else {
    img = loadImage("inky.png");
  }
}