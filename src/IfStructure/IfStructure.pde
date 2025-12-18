//Ethan Tang | 9/9/2025 | If Structure

void setup() {
  size(820, 200);
  background(#3a4c40);
}

void draw() {
  //assigns grade
  background(#3a4c40);
  float grade=0.001;
  float a=mouseX;
  grade=(a-10)/200;
  if (grade<0.001) {
    grade=0.000;
  } else if (grade>4.000) {
    grade=4.000;
  }

  //Render everything
  calcgrade(grade);
  textAlign(CENTER);
  textSize(16);
  text(calcgrade(mouseX/200.0), width/2, height/2+50);

  tlineDisplay(grade);
}

String calcgrade(float grade) {
  //grading system
  String returnGrade = "";
  if (grade>=3.5) {
    returnGrade = "Assign letter grade A.";
  } else if (grade>=3) {
    returnGrade = "Assign letter grade A-";
  } else if (grade>=2.83) {
    returnGrade = "Assign letter grade B+";
  } else if (grade>=2.67) {
    returnGrade = "Assign letter grade B";
  } else if (grade>=2.50) {
    returnGrade = "Assign letter grade B-";
  } else if (grade>=2.34) {
    returnGrade = "Assign letter grade C+";
  } else if (grade>=2.17) {
    returnGrade = "Assign letter grade C";
  } else if (grade>=2.00) {
    returnGrade = "Assign letter grade C-";
  } else if (grade>=1.66) {
    returnGrade = "Assign letter grade D+";
  } else if (grade>=1.33) {
    returnGrade = "Assign letter grade D";
  } else if (grade>=1.00) {
    returnGrade = "Assign letter grade D-";
  } else {
    returnGrade = "Assign letter grade F";
  }
  return returnGrade;
}


Float tlineDisplay(float grade) {

  //Render Timeline
  textSize(25);
  text("Grade Converter : By Ethan Tang",width/2,50);
  circle(grade*200+10, height/2, 7);
  textSize(14);
  fill(#9ccbb8);
  text(str(grade), grade*200+10, height/2-10);
  stroke(255);
  line(10, height/2, 810, height/2);

  for (int p=10; p<811; p=p+80) {
    line(p, height/2+10, p, height/2-10);
    float g=0;
    g=g+0.4*(p-10)/80;
    textSize(13);
    text(str(g), p, height/2+20);
  }
  return grade;
}

// Create a method to use in an app to display letter grade based on the
// position of mouseX on a line.
