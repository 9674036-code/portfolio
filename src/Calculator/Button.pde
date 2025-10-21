boolean clicked;

class Button {

  //Member Variables
  int w, h, x, y;
  color c1, c2;
  String val;
  boolean over;

  //constructor
  Button(int x, int y, int w, int h, color c1, color c2, String val) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.c1=c1;
    this.c2=c2;
    this.val=val;
    over=false;
  }

  //Member Methods
  void display() {
    if (over==true) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    rect(x, y, w, h, 30);
    fill(255, 255, 255);
    textAlign(CENTER, CENTER);
    textSize(30);
    text(val, x, y);
  }

  void hover(int tempX, int tempY) {
    if (x>tempX-(w/2) && x<tempX+(w/2) && y>tempY-h/2 && y<tempY+h/2) {
      over=true;
    } else {
      over=false;
    }
  }
  
  void clicked(int tempX, int tempY) {
    if (x>tempX-(w/2) && x<tempX+(w/2) && y>tempY-h/2 && y<tempY+h/2) {
      clicked=true;
    } else {
      clicked=false;
    }
  }
}
