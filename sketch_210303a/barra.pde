class Barra {
  float ul;
  float ur;
  float dl;
  float dr;
  float movey;



  Barra(float tul, float tur, float tdl, float tdr) {
    ul = tul;
    ur = tur;
    dl = tdl;
    dr = tdr;
    movey=0;

  }
   void move(){
    dl=dl+movey;
  }
  
    void display() {
    fill(16,22,108);
    rect(ul-ur/2,dl-dr/2,ur,dr); 
  }

  float izquierda(){
    return ul-ur/2;
  }
  float derecha(){
    return ul+ur/2;
  }
  float arriba(){
    return dl-dr/2;
  }
  float abajo(){
    return dl+dr/2;
  }
 
  
}
