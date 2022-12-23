class Personaje {
  PImage [] player=new PImage[2];
  float x, y;
  int c, ancho, alto;
  boolean saltando;
  float vel;  //velocidad: para emular gravedad(salto)


  //setup/variables valor
  Personaje() {
    // Personaje() {
    for (int i=0; i<2; i++) {//inicializar player
      player[i]=loadImage("run"+i+".png");
      player[i].resize(200, 200);
    }
    x=250;
    y=350;
    ancho=70;
    alto=100;
    c=0;
    saltando=false;
    vel=6;
  }

  //métodos

  void dibujar() {

    //fill(0,0,0,200);
    // rect(x+60,y+50,ancho,alto);

    image( player[c], x, y);
  }

  void saltar() {

    if ( saltando ) {
      y = y - vel;
      vel = vel - 0.2;  //0.2 = indice de friccion

      if (y >= 350 ) {  //si regresa al piso, resetea variables
        vel =6;//que tan alto salta
        saltando = false;  // para que no vuelva a saltar automaticamente
      }
    }
  }

  void update() {
    //velocidad de sprite
    if (frameCount%6==0) {
      c++;
    }
    if ( c == 2) {
      c = 0;
    }
  }


  void teclado() {

    if ( key == ' ')
      saltando = true;
  }
}
