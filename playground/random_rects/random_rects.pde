void setup() {
  size(1000, 1000);
  background(1);
  randomSeed(1);
  float w = 10.0;
  float xPos, yPos, hue, sat;
  color col;
  colorMode(HSB, 1);
  for (int i = 0; i < 100; i++) {
    for(int j = 0; j < 100; j++) {
      hue = random(1.0);
      sat = random(1.0);
      col = color(hue, sat, 1.0);
      fill(col);
      xPos = w * float(i);
      yPos = w * float(j);
      figure(int(random(2)), xPos, yPos, w);
    }
  }
}

void figure(int choice, float left, float top, float w) {
  switch(choice) {
    case 0:
      square(left, top, w);
      break;
    case 1:
      circle(left + w/2, top + w/2, w);
      break;
    case 2:
      triangle(left + w/2, top, left, top + w, left +w, top + w);
      break;
  }
}
