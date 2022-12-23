class Arbol {
  //propiedades
  PImage img;
  float posx, posy;

  //constructor
  Arbol() {
    posx=random(width);
    posy=300;
    img=loadImage("fondo03.png");
  }

  //métodos
  void dibujar() {
    //background(135,125,0);
    posx-=3;
    image(img, posx, posy);
    img.resize(200, 200);
  }

  void update() {
    posx-=2;
  }

  void reciclar() {
    int anchoDeImagen = img.width;

    //paso de borde derecho al izquierdo y viceversa
    if ( posx > width ) posx = -anchoDeImagen;
    if ( posx < -anchoDeImagen ) posx = width;
  }
}
