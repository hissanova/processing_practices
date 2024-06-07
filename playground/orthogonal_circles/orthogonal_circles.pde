void setup(){
  size(1000, 1000);
  translate(500, 500);
  colorMode(HSB, 1.0);
  background((float) 1/3, 0.5, 1.0);
  noFill();
  float r = 100;
  for(int i = 0; i < 6; i++){
    circle(r * tan(i * PI / 6), 0, 2 * r * sqrt(1 + sq(tan(i * PI / 6))));
  }
  line(0, -500, 0, 500);
}
