class Obstaculo {
  //Declarar variables
  PImage  p;
  float x, y;
  int ancho, alto;
  //Constructor
  Obstaculo() {
    p=new PImage();
    p=loadImage("piedra.png");
    x=width;
    y=450;
    ancho=70;
    alto=70;
  }



  //Métodos


  void dibujar() {
    p.resize(ancho, alto);
    image(p, x, y);
    /* pushMatrix();
     rect(x, 460, 60, 60);
     popMatrix();*/
  }

  boolean colision( float x_, float y_, int ancho_, int alto_ ) {
    if (x-ancho/2< x_+60+ancho_/2 && x+ancho/2 > x_+60-ancho_/2 && y-alto/2 < y_+50+alto_/2 && y+alto > y_+50-alto_/2 ) {
      return true;
    } else {
      return false;
    }
  }

  void update(float X) {
    X=x;
    x-=5;
    int anchoDeImagen =p.width;
    //paso de borde derecho al izquierdo y viceversa
    if (x > width ) x = -anchoDeImagen;
    if (x < -anchoDeImagen ) x = width;
  }
}
