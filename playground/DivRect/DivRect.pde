int numA = 38;
int numB = 9;
int scalar = 50;
numA *= scalar;
numB *= scalar;

int wd = numB;
int xPos = 0;
int yPos = 0;
int itr = 0;

size(1000, 1000);
colorMode(HSB, 1);

while(wd > 0){
  itr++;
  if (itr % 2 == 1){
    while(xPos + wd <= numA){
      fill(color(random(1), random(1), 1));      
      rect(xPos, yPos, wd, wd);
      xPos += wd;
    }
    wd = numA - xPos;
  } else {
    while(yPos + wd < numB){
      fill(color(random(1), random(1), 1));      
      rect(xPos, yPos, wd, wd);
      yPos += wd;
    }
    wd = numB - yPos;
  }
}
