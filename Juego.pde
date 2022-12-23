class Juego {

  // -----------------------------------------------------
  // PROPIEDADES (variables)
  Personaje p;
  int pantalla;
  Arbol[] a=new Arbol[4];
  Nube[] n=new Nube[5];
  int t_base, t_cant, time;
  Estado e;
  Obstaculo o;
  // -----------------------------------------------------
  // CONSTRUCTOR (setup del objeto)
  Juego() {
    p=new Personaje();
    e=new Estado();
    o=new Obstaculo();
    pantalla=0;
    time=0;
    t_base = millis();  //inicializo reloj
    t_cant = 20000;
  }


  // -----------------------------------------------------
  // METODOS (funciones)

  void dibujar() {
    if (pantalla==0) {
      e.Menu();
    } else if (pantalla==1) {
      e.Jugar();
      p.dibujar();
      p.saltar();
      o.dibujar();
      o.update(5);
    } else if (pantalla==2) {
      e.Ganar();
    } else if (pantalla==3) {
      e.Perder();
    }
  }

  void update() {
    if (pantalla==1) {
      if (o.colision(p.x, p.y, p.ancho, p.alto)) {
        println("CHOQUE");
        pantalla=3;
      }

      p.update();
      time = (t_base + t_cant) - millis(); //time maneja el resultado en si
      if (time/1000>10) {
        fill(0);
        text("Tiempo:"+time/1000, 100, 50);
      } else if (time/1000<11) {
        fill(255, 0, 0);
        text("Tiempo:"+time/1000, 100, 50);
        if (time<=0) {
          pantalla=2;
        }
      }
    } else if (pantalla==3) {
      o.update(10);
    }
  }

  void reciclar() {
    if (pantalla==3||pantalla==0||pantalla==2) {
      t_base=millis();
      t_cant=20000;
    }
  }


  void controles() {
    if (keyCode==' ' && pantalla==0) {
      pantalla=1;
    } else if (pantalla==1) {
      p.teclado();
    } else if ( pantalla==2||pantalla==3) {
      if (keyCode==' ') {
        pantalla=0;
      }
    }
  }
}
