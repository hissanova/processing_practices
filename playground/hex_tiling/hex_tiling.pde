PShape s;  // The PShape object
float r = 25;

void setup() {
  size(1000, 1000);
  colorMode(HSB, 1);
  
  // Creating a custom PShape as a square, by
  // specifying a series of vertices.
  s = createShape();
  s.beginShape();
  //s.fill(0, 0, 255);
  //s.fill(color(random(1.0), 1, 1));
  // s.noStroke();
  s.vertex(r * 0.5 * sqrt(3), r * 0.5);
  s.vertex(r * 0.0, r * 1.0);
  s.vertex(- r * (0.5 * sqrt(3)), r * 0.5);
  s.vertex(- r * (0.5 * sqrt(3)), -r * 0.5);
  s.vertex(r * 0.0, -r * 1.0);
  s.vertex(r * 0.5 * sqrt(3), -r * 0.5);
  s.endShape(CLOSE);
  float[] genS = {r * sqrt(3), 0.0};
  float[] genT = {r * sqrt(3)/2, r * 3/2};
  float[] trans = new float[2];
  int kmax = 20, lmax = 20;
  translate(500, 500);
  for(int k = -kmax; k < kmax; k++){
    for(int l = -lmax; l < lmax; l++){
      trans[0] = k * genS[0] + l * genT[0];
      trans[1] = k * genS[1] + l * genT[1];
      shape(s, trans[0], trans[1]);
    }
  }
  save("hex_tiling.png");
}
