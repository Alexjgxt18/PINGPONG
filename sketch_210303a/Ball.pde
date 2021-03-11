class Ball {
  float x;
  float y;
  float movey;
  float movex;
  float diameter;

  Ball(float tempX, float tempY, float tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    movey=0;
    movex=0;
  }

  
  void display() {
    fill(16,22,108);
    ellipse(x,y,diameter,diameter); 
  }
  void move(){
    y=y+movey;
    x=x+movex;
  }
  
  float derecha(){
    return x+diameter/2;
  }
    float izquierda(){
    return x-diameter/2;
  }
    float arriba(){
    return y-diameter/2;
  }
    float abajo(){
    return y+diameter/2;
  }
  
}
