void setup(){
  Iteration1 iter = new Iteration1(1., 3.);
  // Iteration2 iter = new Iteration2();
  println(iter.limit());
  float x = iter.initialVal();
  println(x);
  size(500, 200); 
  stroke(255, 0, 0);
  
  MyMap myMap = new MyMap(iter.a, iter.upperBound(), 0, height);
  float limPos = myMap.transform(iter.limit());
  line(0, limPos, width, limPos);
  
  int steps = 10; 
  float step_width = (float) width / steps;
  stroke(0);
  for(int i = 0; i < steps; i++){
    float nextX = iter.nextVal(x);
    println(x, nextX);
    float pos = myMap.transform(x);
    float nextPos = myMap.transform(nextX);
    line(i * step_width, pos, (i + 1) * step_width, nextPos);
    x = nextX;  
  }
}

class MyMap{
  float inf1, sup1, inf2, sup2;
  MyMap(float i1, float s1, float i2, float s2){
    inf1 = i1; sup1 = s1; inf2 = i2; sup2 = s2;
  }
  float transform(float val){
  return map(val, inf1, sup1, inf2, sup2);}
}

class Iteration1{
  public float a, b;
  Iteration1(float arg1, float arg2){a = arg1; b = arg2;}
  public float limit(){return (a + sqrt(a * a + 4 * a / b))/2;}
  public float upperBound(){return 1.5 * a;}
  public float initialVal(){return a + 1/b;}
  public float nextVal(float x){
    return a + 1 /(b + 1/x);
  }
}

class Iteration2{
  public float limit(){return 0.0;}
  public float upperBound(){return 5.0;}
  public float initialVal(){return 1.0;}
  public float nextVal(float x){
    return sqrt(1 + sqrt(x));
  }
}
