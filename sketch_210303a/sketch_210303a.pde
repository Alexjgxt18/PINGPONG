//configuracion inicial
Ball ball;
Barra barraderecha;
Barra barraizquierda;
int puntoizquierda=0;
int puntoderecha=0;
import processing.serial.*;
import java.util.List;
import java.text.*;
Serial myPort;                       // The serial port
int[] serialInArray = new int[3];    // Where we'll put what we receive
int serialCount = 0;                 // A count of how many bytes we receive
boolean newData = false;
float inByte;         // Incoming serial data


void setup() {
  size(800, 600); //tamano de la ventana
 
  ball = new Ball(width/2, height/2, 50);
    ball.movex=5;
   ball.movey=random(-3,3);
  //fill(0,255,100); //color de los objetos creados

    barraizquierda = new Barra(15, 30, 0,150);
    barraderecha = new Barra(width-15,30, 0,150);
//    println(Serial.list());

    String portName = Serial.list()[0];
    myPort = new Serial(this, "COM3", 9600);
    myPort.bufferUntil('\n');
    
}

//se va refrescar constantemente
void draw() {
 //line(0, 0, width, height); //dibujo de la linea
   background(255,255,255); //color de fondo
   ball.display();
   ball.move();   
      if (ball.izquierda() < 0) {
            puntoderecha = puntoderecha +1;
            ball.x = width/2;
            ball.y = height/2;
  }
      if (ball.derecha() > width) {
            puntoizquierda=puntoizquierda+1;
            ball.x = width/2;
            ball.y = height/2;
  }
      if (ball.arriba() < 0) {
        ball.movey = -ball.movey;
  }
      if (ball.abajo() > height) {
        ball.movey = -ball.movey;
  }
      if (barraizquierda.abajo()>height){
         barraizquierda.dl=height-barraizquierda.dr/2;
   }
         if (barraizquierda.arriba()<0){
         barraizquierda.dl=barraizquierda.dr/2;
   }
         if (barraderecha.abajo()>height){
         barraderecha.dl=height-barraderecha.dr/2;
   }
         if (barraderecha.arriba()<0){
         barraderecha.dl=barraderecha.dr/2;
   }
       if (ball.izquierda()<barraizquierda.derecha()&&ball.y>barraizquierda.arriba()&&ball.y<barraizquierda.abajo()){
         ball.movex = -ball.movex;
          ball.movey = map(ball.y - barraizquierda.dr, -barraizquierda.dl/2, barraizquierda.dl/2, -10, 10);
       }
          if (ball.derecha()>barraderecha.izquierda()&&ball.y>barraderecha.arriba()&&ball.y<barraderecha.abajo()){
         ball.movex = -ball.movex;
          ball.movey = map(ball.y - barraderecha.dr, -barraderecha.dl/2, barraderecha.dl/2, -10, 10);
       }
  barraizquierda.move();
  barraizquierda.display();
  barraderecha.move();
  barraderecha.display();
  
  textSize(40);
  textAlign(CENTER);
  text(puntoderecha, width/2+30, 30); // Right side score
  text(puntoizquierda, width/2-30, 30); // Left side score

}
   void keyPressed(){
    if (keyCode== UP){
      barraderecha.movey=-3;
    }
    if (keyCode== DOWN){
      barraderecha.movey=3;
    }
    if (key== 'w'){
      barraizquierda.movey=-3;
    }
    if (key== 's'){
      barraizquierda.movey=3;
    }
  }
  void keyReleased(){
    if (keyCode== UP){
      barraderecha.movey=0;
    }
    if (keyCode== DOWN){
      barraderecha.movey=0;
    }
    if (key== 'w'){
      barraizquierda.movey=0;
    }
    if (key== 's'){
      barraizquierda.movey=0;
    }
  }
  void serialEvent (Serial myPort) {
  //print(myPort);
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');
  //print(inString);
  StringBuffer newString = new StringBuffer(inString);
  newString.replace(0,1,"");
  print(newString);
  String newString1=newString.toString();
  if (newString1 != null) {
    newString1 = trim(newString1);                // trim off whitespaces.
    inByte = float(newString1);           // convert to a number.
    if (inByte < 127){
      barraderecha.movey=-5;
      barraizquierda.movey=5;
    }
    if (inByte > 127){
      barraderecha.movey=5;
      barraizquierda.movey=-5;
    }
    newData = true; 
  }
}
  
