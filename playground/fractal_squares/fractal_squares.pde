void setup() {
  size(1500, 1500);
  background(125);
  noStroke();
  ArrayList<Rectangle> positions = new ArrayList<Rectangle>();
  color col = color(0, 0, 0);
  Rectangle pos_init = new Rectangle(0, 0, width, col);
  positions = produceRecs(pos_init, 0, 6);
  for (Rectangle pos : positions){
    fill(pos.col);
    rect(pos.left, pos.top, pos.size, pos.size);
  }
}

float[][] scales = new float[][] {
  {0.0, 0.0, 0.25},
  {0.25, 0.25, 0.5},
  {0.0, 0.75, 0.25},
  {0.75, 0.0, 0.25},
  {0.75, 0.75, 0.25},
  {1.0/12, 11.0/24, 1.0/12},
  {11.0/24, 1.0/12, 1.0/12},
  {10.0/12, 11.0/24, 1.0/12},
  {11.0/24, 10.0/12, 1.0/12}
};

color[] pallete = new color[]{
  color(255, 0, 0),
  color(0,0,255),
  color(0,255,0),
  color(0,255,255)};

class Rectangle{
  int top, left, size;
  color col;
  Rectangle(int l, int t, int s, color c){
    left = l; top = t; size = s;
    col = c;
  }
}

ArrayList<Rectangle> produceRecs(Rectangle pos, int rec_level, int max_level){
  ArrayList<Rectangle> positions = new ArrayList<Rectangle>();
  Rectangle pos_new;
  int index = rec_level % 4;
  color col = pallete[index];
  positions.add(pos);    
  if (rec_level <= max_level){
    ArrayList<Rectangle> positions_new;
    rec_level ++;
    col = pallete[index];
    int size;
    for (float[] scale: scales){
      size = round(scale[2]*pos.size);
      if (size > 0){
        pos_new = new Rectangle(pos.left+round(scale[0]*pos.size), 
                                pos.top+round(scale[1]*pos.size),
                                size, col);
        positions_new = produceRecs(pos_new, rec_level, max_level);
        positions = concatArrayList(positions, positions_new);
      }
    }
  }
  return positions;
}

ArrayList concatArrayList(ArrayList a, ArrayList b){
  for (int i=0; i<b.size();i++){
    a.add(b.get(i));
  }
  return a;
}
