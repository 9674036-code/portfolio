class Car {
  //Member variables-data
  color c;
  float x;
  float y;
  float speed;
  float Δv;
  boolean even;
  boolean directionR;

  //Constructor
  Car(color c) {
    this.c=c;
    x=random(0, width);
    y=random(0, height);
    speed=random(1, 5);
    Δv=0.04;
  }
  //Member Methods
  void evenTrue() {
    even=true;
  }

  void evenFalse() {
    even=false;
  }

  void directionRTrue() {
    directionR=true;
  }

  void directionRFalse() {
    directionR=false;
  }

  void move() {
    if (even==true) {
      x = x + speed+Δv;
      Δv+=0.04;
      println(Δv);
      if (x > width) {
        x = 0;
        y=random(0, height);
        speed=(random(1, 5));
        Δv=0.04;
        directionR=true;
      }
    }
    if (even==false) {
      x = x - speed-Δv;
      Δv+=0.04;
      println(Δv);
      if (x <0) {
        x = width;
        y=random(0, height);
        speed=(random(1, 5));
        Δv=0.04;
        directionR=false;
      }
    }
  }

  void display() {
    if (directionR==true) {
      fill(0);
      rect(x-12, y, 7, 21, 2);
      rect(x+12, y, 7, 21, 2);
      fill(c);
      rectMode(CENTER);
      rect(x, y, 35, 15, 6);
      fill(200);
      rect(x+9, y, 9, 12, 3);
    }
    if (directionR==false) {
      fill(0);
      rect(x-12, y, 7, 21, 2);
      rect(x+12, y, 7, 21, 2);
      fill(c);
      rectMode(CENTER);
      rect(x, y, 35, 15, 6);
      fill(200);
      rect(x-9, y, 9, 12, 3);
    }
  }
}
