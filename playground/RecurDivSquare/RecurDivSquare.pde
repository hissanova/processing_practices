int numA = 39;
int numB = 8;
float ratio = (float) numB / numA;
float thr = 10; // threshold

void setup(){
  size(1000, 1000);
  colorMode(HSB, 1);
  divSquare(0, 0, width);
}

void divSquare(float xPos, float yPos, float wd){
  int itr = 0;
  float xEndPos = wd + xPos;
  float yEndPos = wd + yPos;
  fill(color(random(1), 0.5, 1));
  square(xPos, yPos, wd);  
  while(wd > thr){
    itr++;
    if (itr % 2 == 1){
      while(xPos + wd * ratio < xEndPos + 0.1){
        divRect(xPos, yPos, wd * ratio, wd);
        xPos += wd * ratio;
      }
      wd = xEndPos - xPos;
    } else {
      while(yPos + wd / ratio < yEndPos + 0.1){
        divRect(xPos, yPos, wd,  wd / ratio);
        yPos += wd / ratio;
      }
      wd = yEndPos - yPos;
    }
  }  
}

void divRect(float xPos, float yPos, float wd, float ht){
  int itr = 0;
  float xEndPos = xPos + wd;
  float yEndPos = yPos + ht;
  fill(color(random(1), 0.5, 1));
  rect(xPos, yPos, wd, ht);
  while(wd > thr){
    itr++;
    if(itr % 2 ==0){
      while(xPos + wd < xEndPos + 0.1){
        divSquare(xPos, yPos, wd);
        xPos += wd;
      }
      wd = xEndPos - xPos;
    } else {
      while(yPos + wd < yEndPos + 0.1){
        divSquare(xPos, yPos, wd);
        yPos += wd;
      }
      wd = yEndPos - yPos;
    }
  }
}
