void setup() {
  size(1000, 1000);
  background(125);
  noStroke();
  ArrayList<int[]> positions = new ArrayList<int[]>();
  int[] pos = {0, 0, width, 0};
  int[] pos_new;
  int col;
  /*for (int i=1;i <=1;i++){
    col = 255 * (i % 2);
    pos_new = new int[] {pos[0], pos[1], pos[2]/4, col};
    positions.add(pos_new);
    pos_new = new int[] {pos[0]+pos[2]/4, pos[1]+pos[2]/4, pos[2]/2, col};
    positions.add(pos_new);
    pos_new = new int[] {pos[0]+3*pos[2]/4, pos[1]+3*pos[2]/4, pos[2]/4, col};
    positions.add(pos_new);    
  }*/
  positions = get_positions(pos, 0, 5);
  for (int i=0; i < positions.size();i++){
    pos = positions.get(i);
    draw(pos[0], pos[1], pos[2], pos[2], pos[3]);
  }
}

ArrayList<int[]> get_positions(int[] pos, int rec_level, int max_level){
  ArrayList<int[]> positions = new ArrayList<int[]>();
  int[] pos_new; int col;
  col = 255 * (rec_level % 2);
  positions.add(pos);    
  if (rec_level < max_level){
    rec_level ++;
    col = 255 * (rec_level % 2);  
    pos_new = new int[] {pos[0], pos[1], pos[2]/4, col};
    ArrayList<int[]> positions_new = get_positions(pos_new, rec_level, max_level);
    positions = concat_ArrayList(positions, positions_new);
    pos_new = new int[] {pos[0]+pos[2]/4, pos[1]+pos[2]/4, pos[2]/2, col};
    positions_new = get_positions(pos_new, rec_level, max_level);
    positions = concat_ArrayList(positions, positions_new);
    pos_new = new int[] {pos[0]+3*pos[2]/4, pos[1]+3*pos[2]/4, pos[2]/4, col};
    positions_new = get_positions(pos_new, rec_level, max_level);
    positions = concat_ArrayList(positions, positions_new);
  }
  return positions;
}

ArrayList<int[]> concat_ArrayList(ArrayList<int[]> a, ArrayList<int[]> b){
  for (int i=0; i<b.size();i++){
    a.add(b.get(i));
  }
  return a;
}
void draw(float left, float top, float w, float h, int col){
  fill(col);  
  rect(left, top, w/4, h/4);
  rect(left + w/4, top + h/4, w/2, h/2);
  rect(left + 0.75*w, top + 0.75*w, w/4, h/4);
}
