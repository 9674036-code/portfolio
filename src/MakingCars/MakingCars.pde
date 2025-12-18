//Ethan Tang | 9/18/2025 | Making Cars
Car car1, car2;
Car[] cars = new Car[100];

void setup() {
  size(1000, 200);
  car1=new Car(color(random(255), random(255), random(255), 50));
  car2=new Car(color(random(255), random(255), random(255), 50));
  for (int i=0; i<cars.length; i+=1) {
    if (i%2==0) {
      cars[i]=new Car(color(random(255), random(255), random(255), 50));
      cars[i].evenTrue();
      cars[i].directionRTrue();
    } else {
      cars[i]=new Car(color(random(255), random(255), random(255), 50));
      cars[i].evenFalse();
      cars[i].directionRFalse();
    }
  }
}

void draw() {
  background(255);
  car1.move();
  car1.display();
  car2.move();
  car2.display();
  for (int i=0; i<cars.length; i+=1) {
    cars[i].display();
    cars[i].move();
  }
}
