import processing.pdf.*;

int numA = 17;
int numB = 12;

void setup(){
  randomSeed(0);
  size(1000, 1000);
  colorMode(HSB, 1);
  // float ratio = (float) numB/numA;
  float ratio = sqrt(2);
  float xPos = 0;
  float yPos = 0;
  int itr = 0;
  float wd = width;
  String namePNG = str(numA) + "_" + str(numB) + ".png";
  String namePDF = str(numA) + "_" + str(numB) + ".pdf";
  
  beginRecord(PDF, namePDF);
  while(wd > 0.1){
    itr++;
    if (itr % 2 == 0){
      while(xPos + wd * ratio < width + 0.1){
        fill(color(random(1), random(1), 1));
        rect(xPos, yPos, wd * ratio, wd);
        xPos += wd * ratio;
      }
      wd = width - xPos;
    } else {
      while(yPos + wd / ratio < width + 0.1){
        fill(color(random(1), random(1), 1));      
        rect(xPos, yPos, wd, wd / ratio);
        yPos += wd / ratio;
      }
      wd = width - yPos;
    }
  }
  endRecord();
  println("finished");
  save(namePNG);
}
