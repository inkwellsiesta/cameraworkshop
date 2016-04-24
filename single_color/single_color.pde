PImage img;
boolean single_color;

void setup() {
  size(750, 500);
  img = loadImage("flowers.jpg");
  colorMode(HSB);
  single_color = false;
}

void draw() {
  background(0);
  image(img, 0, 0);
}

void mouseClicked() {
  single_color = !single_color;
  if (single_color) {
  float h = hue(get(mouseX, mouseY));
  img.loadPixels();
  
  for (int i = 0; i < img.width; i++) {
    for (int j = 0; j < img.height; j++) {
      color c = img.get(i,j);
      float ph = hue(c);
      if (abs(ph - h) > 10.) {
        img.set(i, j, color(hue(c), map(abs(ph-h), 0, 10, 255, 0), brightness(c)));
      }
    }
  }
  img.updatePixels();
  }
  else {
    img = loadImage("flowers.jpg");
  }
}