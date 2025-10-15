//Ethan Tang | 9/25/25 | Calculator

StringList standardCalc;
StringList vals;
FloatList xVals;
FloatList lineVals;
Button[] opButtons=new Button[10];
Button[] numButtons=new Button[10];
Button[] cmdButtons=new Button[4];

boolean reset=false;
boolean xSet=false;
boolean window=false;
boolean graphing=false;
boolean negative=false;
boolean firstDigit=true;
int pressedCounter, minusI, plusI, tOp, opPlacement;
int windowCount=0;
int flash=0;
int Toggle=1;
int graphToggle=-1;
int windowToggle=-1;
int grWinToggle=-1;
float initial;
float xMax=10;
float xMin=-10;
float yMax=10;
float yMin=-10;
float x;
String dVal, fVal, fVal2, cmdMonitor, xPlaceh, yPlaceh;
String result=" ";

boolean isNums(String a) {
  try {
    Float.parseFloat(a);
    return true;
  }
  catch(NumberFormatException e) {
    return false;
  }
}

void setup() {
  size (770, 900);
  stroke(30);
  rectMode(CENTER);
  dVal="0";
  vals=new StringList();
  standardCalc=new StringList();
  cmdButtons[0] = new Button(100-20, 520, 100, 100, #ccb5e8, #DED3EB, "C");
  opButtons[0] = new Button(220-20, 520, 80, 100, #9fd2e3, #C1DDE6, "÷");
  opButtons[1] = new Button(340-30, 520, 80, 100, #9fd2e3, #C1DDE6, "X");
  opButtons[2] = new Button(460-40, 520, 80, 100, #9fd2e3, #C1DDE6, "-");
  opButtons[3] = new Button(580-50, 520, 80, 100, #9fd2e3, #C1DDE6, "+");
  for (int counter=1; counter<10; counter++) {
    int Ycounter=floor(counter*0.33);
    numButtons[counter] = new Button(80+((140*(counter-1))-(Ycounter*420)), 640-10+(70*Ycounter), 100, 60, #9fd2e3, #C1DDE6, str(counter));
  }
  opButtons[4] = new Button(100-20, 840, 100, 60, #9fd2e3, #C1DDE6, "±");
  numButtons[0] = new Button(100+140-20, 840, 100, 60, #9fd2e3, #C1DDE6, "0");
  opButtons[5] = new Button(100+140*2-20, 840, 100, 60, #9fd2e3, #C1DDE6, ".");
  cmdButtons[1] = new Button(580-60+20, 630, 140, 100, #456145, #648264, "Graph");
  opButtons[6] = new Button(580-60, 720-6, 100, 60, #456145, #648264, "x");
  opButtons[7] = new Button(580-60, 720+60-3, 100, 60, #456145, #648264, "^");
  opButtons[9] = new Button(580-60, 720+60*2, 100, 60, #456145, #648264, "√");
  cmdButtons[2] = new Button(760-90+10, 630, 120, 100, #456145, #648264, "Window");
  opButtons[8] = new Button(760-90, 630+90, 140, 60, #456145, #648264, "log");
  cmdButtons[3] = new Button(760-90, 630+180, 140, 100, #ccb5e8, #DED3EB, "EXE");
}

void draw() {
  background(40);
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<cmdButtons.length; i++) {
    cmdButtons[i].display();
    cmdButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void keyPressed() {
  for (int i=0; i<numButtons.length; i++) {
    if (str(key)==numButtons[i].val) {
      dVal=str(i);
      pressedCounter++;
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if (str(key)==opButtons[i].val) {
      if (str(key).equals("±")) {
        negative=true;
      } else {
        dVal=opButtons[i].val;
        pressedCounter++;
      }
    }
  }
  for (int i=0; i<cmdButtons.length; i++) {
    if (str(key)==cmdButtons[i].val || key==ENTER|| key==RETURN) {
      if (i==0) {
        cmdMonitor="C";
        println(cmdMonitor);
      } else if (key==ENTER || key==RETURN) {
        cmdMonitor="ExE";
        println(cmdMonitor);
      }
    }
  }
}

void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].clicked(mouseX, mouseY);
    if (clicked==true) {
      dVal=str(i);
      pressedCounter++;
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].clicked(mouseX, mouseY);
    if (clicked==true) {
      if (opButtons[i].val.equals("±")) {
        negative=true;
      } else {
        dVal=opButtons[i].val;
        pressedCounter++;
      }
    }
  }
  for (int i=0; i<cmdButtons.length; i++) {
    cmdButtons[i].clicked(mouseX, mouseY);
    if (clicked==true) {
      if (i==0) {
        cmdMonitor="C";
        println(cmdMonitor);
      } else if (cmdButtons[i]==cmdButtons[1]) {
        graphToggle*=(-1);
        if (graphToggle>0) {
          graphing=true;
        } else if (graphToggle<0) {
          graphing=false;
        }
      } else if (cmdButtons[i]==cmdButtons[2]) {
        windowToggle*=(-1);
        if (windowToggle>0) {
          window=true;
        } else if (windowToggle<0) {
          window=false;
        }
      } else if (cmdButtons[i]==cmdButtons[3]) {
        cmdMonitor="EXE";
        println(cmdMonitor);
      }
    }
  }
}

void updateDisplay() {

  fill(230); //display window setup
  stroke(30);
  strokeWeight(0.1);

  beginShape(); //display window draw start
  vertex(555, 460);
  vertex(605, 560);
  vertex(760, 560);
  vertex(760, 410);
  beginContour();
  curveVertex(555, 460);
  curveVertex(555, 460);
  curveVertex(566, 462);
  curveVertex(574, 465);
  curveVertex(583, 470);
  curveVertex(593, 485);
  curveVertex(603, 510);
  curveVertex(604, 525);
  curveVertex(605, 555);
  curveVertex(605, 560);
  curveVertex(605, 560);
  endContour();
  endShape(CLOSE);
  stroke(230);
  rectMode(CORNER);
  rect(605, 520, 155, 50, 17);
  rect(20, 20, 740, 440, 20); //display window draw end

  fill(30); //text setup
  textSize(35);
  strokeWeight(6);
  textAlign(LEFT);

  if (flash==0) { //flashing cursor
    Toggle=Toggle*(-1);
    flash=+1;
  } else if (flash>0) {
    flash++;
    if (flash==20) {
      flash=0;
    }
  }
  if (Toggle>0) {
  } else if (Toggle<0) {
    stroke(30);
    line(25+(pressedCounter*18), 55, 25+(pressedCounter*18), 80);
  }
  strokeWeight(1);
  stroke(230);

  //vals setup
  if (pressedCounter>0 && dVal!=" ") {
    vals.resize(pressedCounter);
    vals.set(pressedCounter-1, dVal);
    dVal=" ";
  }
  if (negative==true) {
    if (vals.size()==1) {
      vals.set(0, str(int(vals.get(0))*(-1)));
    } else if (vals.size()>1) {
      for (int i=vals.size()-1; i>-1; i--) {
        if (Float.isNaN(float(vals.get(i)))&&vals.get(i)!=".") {
          vals.set(i+1, str(int(vals.get(i+1))*(-1)));
          break;
        } else if (i==0) {
          vals.set(0, str(int(vals.get(0))*(-1)));
        }
      }
    }
  }
  println(vals); //check on vals

  if (cmdMonitor=="C") { //Clear Button code
    vals.clear();
    pressedCounter=(0);
    cmdMonitor=" ";
    fVal=" ";
    result=" ";
    firstDigit=true;
    xSet=false;
  }
  if (cmdMonitor=="EXE"&&graphing==false&&window==false) {
    performCalculation();
    println(cmdMonitor);
    cmdMonitor=" ";
  } else if (cmdMonitor=="EXE"&&graphing==true&&window==false) {
    grWinToggle*=(-1);
    cmdMonitor=" ";
  } else if (cmdMonitor=="EXE"&&window==true) {
    windowCount++;
    cmdMonitor=" ";
  }

  if (graphing==true) {
    fill(30);
    textSize(20);
    textAlign(CENTER);
    text("Graph Mode (y=)", width/2, 45);
    textAlign(LEFT);
    textSize(35);
  }

  if (vals.size()>0) {
    fVal=vals.get(0);
    for (int i=1; i<vals.size(); i++) {
      fVal=fVal+vals.get(i);
    }
  }

  if (fVal!=null) {
    println(fVal);
    text(fVal, 25, 45, 740, 440);
  }
  if (result!=null) {
    textAlign(RIGHT);
    text(result, 730, 100);
    textAlign(LEFT);
  }
  if (grWinToggle>0 && graphing==true) {
    graphCalc();
    fill(230);
    stroke(230);
    rect(20, 20, 740, 440, 20);
    strokeWeight(2);
    stroke(30);
    line(width/2, 20, width/2, 460);
    line(20, 240, 760, 240);
    for (int i=0; i<abs(xMax)+abs(xMin)+1; i++) {
      line(20+(740/(abs(xMax)+abs(xMin))*i), 240+2,20+(740/(abs(xMax)+abs(xMin))*i), 240-2);
    }
    for (int i=0; i<abs(yMax)+abs(yMin)+1; i++) {
      line(width/2-2, 20+(440/(abs(yMin)+abs(yMax))*i), width/2+2, 20+(440/(abs(yMin)+abs(yMax))*i));
    }
    for (int input=0; input<lineVals.size(); input++) {

      if (input<148) {
        if (xVals.get(input+1)<20||xVals.get(input+1)>760||lineVals.get(input+1)<20||lineVals.get(input+1)>460) {
        } else {
          line(xVals.get(input), lineVals.get(input), xVals.get(input+1), lineVals.get(input+1));
        }
      }
    }
  }
  if (window==true) {
    fill(230);
    rect(20, 20, 740, 440, 20);
    fill(30);
    textSize(20);
    textAlign(CENTER);
    text("Change Window)", width/2, 45);
    textAlign(LEFT);
    textSize(35);
    text("X Range:", 20, 150);
    text("Y Range:", 20, 300);
    if (windowCount==0&&windowCount<1) {
      for (int i=0; i<vals.size(); i++) {
        if (i==0) {
          xPlaceh=vals.get(i);
        } else if (i>0) {
          xPlaceh=xPlaceh+vals.get(i);
        }
        text(xPlaceh, 150, 150);
      }
    } else if (windowCount==1) {
      if (reset==false) {
        vals.clear();
        pressedCounter=(0);
        cmdMonitor=" ";
        fVal=" ";
        result=" ";
        firstDigit=true;
        xSet=false;
        reset=true;
      }
      for (int i=0; i<vals.size(); i++) {
        if (i==0) {
          yPlaceh=vals.get(i);
        } else if (i>0) {
          yPlaceh=yPlaceh+vals.get(i);
        }
        text(yPlaceh, 150, 300);
      }
      text(xPlaceh, 150, 150);
    } else if (windowCount>1) {
      xMax=float(xPlaceh)/2;
      xMin=(float(xPlaceh)/2)*(-1);
      yMax=float(yPlaceh)/2;
      yMin=(float(yPlaceh)/2)*(-1);
      windowCount=0;
      windowToggle*=(-1);
      window=false;
      cmdMonitor="C";
    }
  }

  negative=false;
}


void performCalculation() {
  fill(30);
  textAlign(LEFT);
  tOp=0;
  standardCalc=new StringList();

  for (int i=0; i<vals.size(); i++) {
    if (Float.isNaN(float(vals.get(i)))&&vals.get(i)!="."&&vals.get(i)!="x") {
      standardCalc.resize(standardCalc.size()+2);
      println(standardCalc);
      println(standardCalc.size());
      standardCalc.set(standardCalc.size()-2, vals.get(i));
      tOp++;
      firstDigit=true;
    } else if (!Float.isNaN(float(vals.get(i))) || vals.get(i).equals(".")||vals.get(i).equals("x")) {
      if (tOp==0) {
        if (firstDigit==true) {
          standardCalc.append(vals.get(i));
          firstDigit=false;
          println(standardCalc);
        } else if (firstDigit==false) {
          standardCalc.set(standardCalc.size()-1, standardCalc.get(standardCalc.size()-1)+vals.get(i));
        }
      } else {
        if (firstDigit==true) {
          standardCalc.set(standardCalc.size()-1, vals.get(i));
          firstDigit=false;
        } else if (firstDigit==false) {
          standardCalc.set(standardCalc.size()-1, standardCalc.get(standardCalc.size()-1)+vals.get(i));
        }
      }
    }
  }


  println(standardCalc);
  for (int i=0; i<tOp; i++) {
    for (int i2=0; i<(standardCalc.size())-1; i2++) {
      if (standardCalc.get(i2).equals("log")) {
        minusI=i2-1;
        plusI=i2+1;
        standardCalc.set(i2, str((log(float(standardCalc.get(plusI))))/(log(float(standardCalc.get(minusI))))));
        println(i, float(standardCalc.get(minusI))*float(standardCalc.get(plusI)));
        standardCalc.remove(plusI);
        standardCalc.remove(minusI);
        println(standardCalc);
        break;
      }
      if (i2==standardCalc.size()-1) {
        break;
      }
    }
    for (int i2=0; i<(standardCalc.size())-1; i2++) {
      if (standardCalc.get(i2).equals("^")) {
        minusI=i2-1;
        plusI=i2+1;
        standardCalc.set(i2, str(pow(float(standardCalc.get(minusI)), float(standardCalc.get(plusI)))));
        println(i, str(pow(float(standardCalc.get(minusI)), float(standardCalc.get(plusI)))));
        standardCalc.remove(plusI);
        standardCalc.remove(minusI);
        println(standardCalc);
        break;
      }
      if (i2==standardCalc.size()-1) {
        break;
      }
    }
    for (int i2=0; i<(standardCalc.size())-1; i2++) {
      if (standardCalc.get(i2).equals("√")) {
        plusI=i2+1;
        standardCalc.set(i2, str(sqrt(float(standardCalc.get(plusI)))));
        println(i, str(sqrt(float(standardCalc.get(minusI)))));
        standardCalc.remove(plusI);
        println(standardCalc);
        break;
      }
      if (i2==standardCalc.size()-1) {
        break;
      }
    }
    for (int i2=0; i<(standardCalc.size())-1; i2++) {
      if (standardCalc.get(i2).equals("X")) {
        minusI=i2-1;
        plusI=i2+1;
        standardCalc.set(i2, str(float(standardCalc.get(minusI))*float(standardCalc.get(plusI))));
        println(i, float(standardCalc.get(minusI))*float(standardCalc.get(plusI)));
        standardCalc.remove(plusI);
        standardCalc.remove(minusI);
        println(standardCalc);
        break;
      }
      if (i2==standardCalc.size()-1) {
        break;
      }
    }
    for (int i2=0; i<standardCalc.size()-1; i2++) {
      if (standardCalc.get(i2).equals("÷")) {
        minusI=i2-1;
        plusI=i2+1;
        standardCalc.set(i2, str(float(standardCalc.get(minusI))/float(standardCalc.get(plusI))));
        println(i, float(standardCalc.get(minusI))/float(standardCalc.get(plusI)));
        standardCalc.remove(plusI);
        standardCalc.remove(minusI);
        println(standardCalc);
        break;
      }
      if (i2==standardCalc.size()-1) {
        break;
      }
    }
    for (int i2=0; i<standardCalc.size()-1; i2++) {
      if (standardCalc.get(i2).equals("-")) {
        minusI=i2-1;
        plusI=i2+1;
        standardCalc.set(i2, str(float(standardCalc.get(minusI))-float(standardCalc.get(plusI))));
        println(i, float(standardCalc.get(minusI))-float(standardCalc.get(plusI)));
        standardCalc.remove(plusI);
        standardCalc.remove(minusI);
        println(standardCalc);
        break;
      }
      if (i2==standardCalc.size()-1) {
        break;
      }
    }
    for (int i2=0; i<standardCalc.size()-1; i2++) {
      if (standardCalc.get(i2).equals("+")) {
        minusI=i2-1;
        plusI=i2+1;
        standardCalc.set(i2, str(float(standardCalc.get(minusI))+float(standardCalc.get(plusI))));
        println(i, float(standardCalc.get(minusI))+float(standardCalc.get(plusI)));
        standardCalc.remove(plusI);
        standardCalc.remove(minusI);
        println(standardCalc);
        break;
      }
      if (i2==standardCalc.size()-1) {
        break;
      }
    }
  }

  result=standardCalc.get(0);
  println(standardCalc);
  println(result);
}

void graphCalc() {
  lineVals=new FloatList();
  xVals=new FloatList();

  for (x=xMin; x<xMax+0.01; x=x+((abs(xMin)+abs(xMax))/148)) {
    xVals.append(x);

    tOp=0;
    standardCalc=new StringList();
    for (int i=0; i<vals.size(); i++) {
      if (!isNums(vals.get(i))&&!vals.get(i).equals(".")&&!vals.get(i).equals("x")) {
        standardCalc.append(vals.get(i));
        println(standardCalc);
        println(standardCalc.size());
        tOp++;
        firstDigit=true;
      } else if (isNums(vals.get(i)) || vals.get(i).equals(".")||vals.get(i).equals("x")) {
        if (tOp==0) {
          if (vals.get(i).equals("x")) {
            standardCalc.append(str(x));
          } else if (firstDigit==true) {
            standardCalc.append(vals.get(i));
            firstDigit=false;
            println(standardCalc);
          } else if (firstDigit==false) {
            standardCalc.set(standardCalc.size()-1, standardCalc.get(standardCalc.size()-1)+vals.get(i));
          }
        } else {
          if (firstDigit==true) {
            if (vals.get(i).equals("x")) {
              standardCalc.append(str(x));
            } else {
              standardCalc.append(vals.get(i));
              firstDigit=false;
            }
          } else if (firstDigit==false) {
            if (vals.get(i).equals("x")) {
              standardCalc.set(standardCalc.size()-1, str(x));
            } else {
              standardCalc.set(standardCalc.size()-1, standardCalc.get(standardCalc.size()-1)+vals.get(i));
            }
          }
        }
      }
    }
    println(standardCalc);
    for (int i=0; i<tOp; i++) {
      for (int i2=0; i<(standardCalc.size())-1; i2++) {
        if (standardCalc.get(i2).equals("log")) {
          minusI=i2-1;
          plusI=i2+1;
          standardCalc.set(i2, str((log(float(standardCalc.get(plusI))))/(log(float(standardCalc.get(minusI))))));
          println(i, float(standardCalc.get(minusI))*float(standardCalc.get(plusI)));
          standardCalc.remove(plusI);
          standardCalc.remove(minusI);
          println(standardCalc);
          break;
        }
        if (i2==standardCalc.size()-1) {
          break;
        }
      }
      for (int i2=0; i<(standardCalc.size())-1; i2++) {
        if (standardCalc.get(i2).equals("^")) {
          minusI=i2-1;
          plusI=i2+1;
          standardCalc.set(i2, str(pow(float(standardCalc.get(minusI)), float(standardCalc.get(plusI)))));
          println(i, str(pow(float(standardCalc.get(minusI)), float(standardCalc.get(plusI)))));
          standardCalc.remove(plusI);
          standardCalc.remove(minusI);
          println(standardCalc);
          break;
        }
        if (i2==standardCalc.size()-1) {
          break;
        }
      }
      for (int i2=0; i<(standardCalc.size())-1; i2++) {
        if (standardCalc.get(i2).equals("√")) {
          plusI=i2+1;
          standardCalc.set(i2, str(sqrt(float(standardCalc.get(plusI)))));
          println(i, str(sqrt(float(standardCalc.get(minusI)))));
          standardCalc.remove(plusI);
          println(standardCalc);
          break;
        }
        if (i2==standardCalc.size()-1) {
          break;
        }
      }
      for (int i2=0; i<(standardCalc.size())-1; i2++) {
        if (standardCalc.get(i2).equals("X")) {
          minusI=i2-1;
          plusI=i2+1;
          standardCalc.set(i2, str(float(standardCalc.get(minusI))*float(standardCalc.get(plusI))));
          println(i, float(standardCalc.get(minusI))*float(standardCalc.get(plusI)));
          standardCalc.remove(plusI);
          standardCalc.remove(minusI);
          println(standardCalc);
          break;
        }
        if (i2==standardCalc.size()-1) {
          break;
        }
      }
      for (int i2=0; i<standardCalc.size()-1; i2++) {
        if (standardCalc.get(i2).equals("÷")) {
          minusI=i2-1;
          plusI=i2+1;
          standardCalc.set(i2, str(float(standardCalc.get(minusI))/float(standardCalc.get(plusI))));
          println(i, float(standardCalc.get(minusI))/float(standardCalc.get(plusI)));
          standardCalc.remove(plusI);
          standardCalc.remove(minusI);
          println(standardCalc);
          break;
        }
        if (i2==standardCalc.size()-1) {
          break;
        }
      }
      for (int i2=0; i<standardCalc.size()-1; i2++) {
        if (standardCalc.get(i2).equals("-")) {
          minusI=i2-1;
          plusI=i2+1;
          standardCalc.set(i2, str(float(standardCalc.get(minusI))-float(standardCalc.get(plusI))));
          println(i, float(standardCalc.get(minusI))-float(standardCalc.get(plusI)));
          standardCalc.remove(plusI);
          standardCalc.remove(minusI);
          println(standardCalc);
          break;
        }
        if (i2==standardCalc.size()-1) {
          break;
        }
      }
      for (int i2=0; i<standardCalc.size()-1; i2++) {
        if (standardCalc.get(i2).equals("+")) {
          minusI=i2-1;
          plusI=i2+1;
          standardCalc.set(i2, str(float(standardCalc.get(minusI))+float(standardCalc.get(plusI))));
          println(i, float(standardCalc.get(minusI))+float(standardCalc.get(plusI)));
          standardCalc.remove(plusI);
          standardCalc.remove(minusI);
          println(standardCalc);
          break;
        }
        if (i2==standardCalc.size()-1) {
          break;
        }
      }
    }
    lineVals.append(float(standardCalc.get(0)));
  }
  for (int i=0; i<lineVals.size(); i++) {
    if (lineVals.get(i)>0) {
      lineVals.set(i, 240-(220/abs(yMax)*lineVals.get(i)));
    }
    if (lineVals.get(i)<0) {
      lineVals.set(i, 240+(220/abs(yMin)*(-1)*(lineVals.get(i))));
    }
    if (xVals.get(i)>0) {
      xVals.set(i, 390+(370/abs(xMax)*xVals.get(i)));
    }
    if (xVals.get(i)<0) {
      xVals.set(i, 390-(370/abs(xMin)*(-1)*(xVals.get(i))));
    }
  }
}
