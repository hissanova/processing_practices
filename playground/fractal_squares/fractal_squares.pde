void setup() {
  size(10000, 10000);
  background(125);
  noStroke();
  ArrayList<Rectangle> rectangles = new ArrayList<Rectangle>();
  color col = color(0, 0, 0);
  Rectangle rec_init = new Rectangle(0, 0, width, col);
  rectangles = produceRecs(rec_init, 0, 7);
  for (Rectangle rec : rectangles){
    fill(rec.col);
    rect(rec.left, rec.top, rec.size, rec.size);
  }
  save("fractal_suqares.png");
}

class IterConf{
  float x, y, scale;
  IterConf(float xVal, float yVal, float s){
  x = xVal; y = yVal; scale = s;}
}

IterConf[] iterationConfigs = new IterConf[] {
  new IterConf(0.0, 0.0, 0.25),
  new IterConf(0.25, 0.25, 0.5),
  new IterConf(0.0, 0.75, 0.25),
  new IterConf(0.75, 0.0, 0.25),
  new IterConf(0.75, 0.75, 0.25),
  new IterConf(1.0/12, 11.0/24, 1.0/12),
  new IterConf(11.0/24, 1.0/12, 1.0/12),
  new IterConf(10.0/12, 11.0/24, 1.0/12),
  new IterConf(11.0/24, 10.0/12, 1.0/12)
};

color[] pallete = new color[]{
  color(255, 0, 0),
  color(0,0,255),
  color(0,255,0),
  color(0,255,255)};

class Rectangle{
  float top, left, size;
  color col;
  Rectangle(float l, float t, float s, color c){
    left = l; top = t; size = s;
    col = c;
  }
}

ArrayList<Rectangle> produceRecs(Rectangle parentRect, int rec_level, int max_level){
  ArrayList<Rectangle> retRects = new ArrayList<Rectangle>();
  Rectangle childRect;
  int index = rec_level % 4;
  color col = pallete[index];
  retRects.add(parentRect);    
  if (rec_level <= max_level){
    ArrayList<Rectangle> newRect;
    rec_level ++;
    col = pallete[index];
    float size;
    for (IterConf iterConf: iterationConfigs){
      size = iterConf.scale * parentRect.size;
      if (size >= 1.0){
        childRect = new Rectangle(parentRect.left + iterConf.x*parentRect.size, 
                                  parentRect.top + iterConf.y*parentRect.size,
                                  size, col);
        newRect = produceRecs(childRect, rec_level, max_level);
        retRects = concatArrayList(retRects, newRect);
      }
    }
  }
  return retRects;
}

ArrayList concatArrayList(ArrayList a, ArrayList b){
  for (int i=0; i<b.size();i++){
    a.add(b.get(i));
  }
  return a;
}
