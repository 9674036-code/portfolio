//Ethan Tang | 8/28/2025 | Computer History Timeline

void setup() {
  size(900, 400);
}

void draw() {
  background(10);
  drawRef();

  int a=135;
  while (a < 850) {
    if (a<136 && a>134) {
      textSize(15);
      HistEvent(a-10, 170, "1942:ABC", "Atanasoff–Berry Computer\nThe first binary electronic digital calculating device, semi-electronic and used over 300 vacuum tubes.");
    } else if (a<316 && a>314) {
      textSize(15);
      HistEvent(a-10, 170, "1945:ENIAC", "ENIAC\nFastest and most flexible computer at the time; able to run 5000 operations a second, had a high-speed memory limited to 20 words, weighed 30 tons, consumed 200 kW and contained thousands of individual components.");
    } else if (a<496 && a>494) {
      textSize(15);
      HistEvent(a-10, 170, "1955:CADET", "Harwell CADET\nBuilt with a 64-kilobyte magnetic drum memory, 324-point-contact transistors, 76 junction transistors in order to amplify read data and offered a regular computing service, running sessions of 80 hours or more.");
    } else if (a<676 && a>674) {
      textSize(15);
      HistEvent(a-10, 170, "1964:IBM", "IBM System 360\nBuilt with a combination of third gen and second gen components, and unified IBM computers under an uniform architecture, creating an established business platform model.");
    }
    a = a+180;
  }

  int b=225;
  while (b<850) {

    if (b<226 && b>224) {
      textSize(12);
      HistEvent(b-10, 230, "1944:Colossus", "Colossus Machine\nFirst used to decode ciphers during WWII, considered first digitally programmable computer, but not Turing-complete, broke ciphers via Boolean logic and used a large number of vacuum tubes.");
    } else if (b<406 && b>404) {
      textSize(11);
      HistEvent(b-10, 230, "1949:Manchester", "Manchester Mark 1\nA much more usable version of the Manchester Baby, expanding on the Baby's resemblance to modern computers, allowing programs to read word arrays in memory due to index registers.");
    } else if (b<586 && b>584) {
      textSize(15);
      HistEvent(b-10, 230, "1960:AGC", "Apollo Guidance Computer\nThe first silicon integrated circuit computer,fitting the extreme demands of size, mass and power for the Apollo missions and would lead to what is referenced as a third generation of computers using ICs.");
    } else if (b<766 && b>764) {
      textSize(15);
      HistEvent(b-10, 230, "1975:P6060", "P6060\nThe world's first complete and preassembled personal computer system, excluding Altair. The CPU was divided into 2 cards, built with TTL components and weighed 40 kg, surpassing Altair in capability; the first commercial microcomputer.");
    }
    b=b+180;
  }
}
void drawRef() {

  textAlign(CENTER);
  textSize(40);
  text("Historic Computer Systems", 450, 50);
  textSize(25);
  text("by Ethan Tang", 450, 80);

  //RenderTimeline
  strokeWeight(3);
  line(45, 200, 855, 200);
  int a=135;
  while (a < 850) {
    stroke(#C5DBD2);
    line(a, 200, a-10, 170);
    a = a+180;
  }
  int b=225;
  while (b < 850) {
    stroke(#C5DBD2);
    line(b, 200, b+10, 230);
    b = b+180;
  }
  stroke(#C5DBD2);
  line(45, 210, 45, 190);
  line(855, 210, 855, 190);
  textSize(15);
  fill(#C5DBD2);
  text("1935", 25, 200);
  text("1980", 875, 200);
}

void HistEvent(int x, int y, String title, String detail) {
  rectMode(CENTER);
  fill(#00A8DB);
  rect(x, y, 80, 30, 10);
  fill(#C5DBD2);
  text(title, x, y+6);

  if (mouseX > x - 40 && mouseX < x + 40 && mouseY < y + 15 && mouseY > y - 15) {
    fill(0);
    textSize(20);
    fill(#C5DBD2);
    text(detail, 450, 330, 800, 100);
  }
}
