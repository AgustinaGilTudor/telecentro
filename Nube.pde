class Nube {
  //propiedades
  PImage img;
  float posx, posy;

  //constructor
  Nube(float _posy) {
    posx=random(width);
    posy=_posy;
    img=loadImage("fondo04.png");
  }

  //Métodos
  void dibujar() {
    posx-=3;
    image(img, posx, posy);
    img.resize(200, 200);
  }

  void update() {
    posx-=2 ;
  }

  void reciclar() {
    int anchoDeImagen = img.width;

    //paso de borde derecho al izquierdo y viceversa
    if ( posx > width ) {
      posx = -anchoDeImagen;
    } else if ( posx < -anchoDeImagen ) {
      posx = width;
    }
  }
}
