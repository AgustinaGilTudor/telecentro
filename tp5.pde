//------------------------------------------------------------------------

Juego j;
void setup() {
  size( 800, 600 );
  //inicializo la clase juego
  j= new Juego();
}
//
void draw() {
  //llamo a los métodos de la clase Juego
  j.dibujar();
  j.update();
  j.reciclar();
}

void keyPressed() {
  //metodos de las teclas
  j.controles();
}
