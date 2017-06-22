ArrayList<Window> windows;
int focusIndex;

void setup() {
  fullScreen();
  background(100);
  clearScreen();
  frameRate(100);
  focusIndex = -1;
  windows = new ArrayList<Window>();
}

void clearScreen() {
  fill(255);
  noStroke();
  ellipse(width/2, height/2, height, height);
}

void draw() {
  background(100);
  clearScreen();

  for (int i = 0; i < windows.size(); i++) {
    Window window = windows.get(i);
    window.dragWindow();
    window.drawWindow();
  }
}

class Window {
  int diameter;
  int x;
  int y;

  Window(int diameter, int x, int y) {
    this.diameter = diameter;
    this.x = x;
    this.y = y;
    drawWindow();
  }

  void drawWindow() {

    fill(238, 122, 233);
    ellipse(x, y, diameter, diameter);
    ellipse(x + (diameter/2 * cos(radians(45))), y - (diameter/2 * sin(radians(45))), 40, 40 );
    ellipse(x + (diameter/2 * cos(radians(30))), y - (diameter/2 * sin(radians(30))), 40, 40 );
    ellipse(x + (diameter/2 * cos(radians(60))), y - (diameter/2 * sin(radians(60))), 40, 40 );
    fill(255);
    ellipse(x, y, diameter - 5, diameter - 5);
    fill(255, 140, 0);
    ellipse(x + (diameter/2 * cos(radians(225))), y - (diameter/2 * sin(radians(225))), 40, 40 );
  }

boolean mouseInWindow(){
   if (sqrt(((x - mouseX) * (x - mouseX)) + ((y - mouseY) * (y-mouseY))) < (diameter/2)) {
     return true;
   }else{
     return false;
   }
}
  void dragWindow() {
    if (mousePressed) {
      if (mouseInWindow()) {
        if (sqrt(((width/2 - mouseX) * (width/2 - mouseX)) + ((height/2 - mouseY) * (height/2-mouseY))) < (height/2)-(diameter/2)) {
          x = mouseX;
          y = mouseY;
          pushMatrix();
          translate(x, y);
          popMatrix();
        }
      }
    }
  }
  boolean closingWindow() {
    if (mousePressed) {
      if (sqrt(((x + (diameter/2 * cos(radians(30))) - mouseX) * (x + (diameter/2 * cos(radians(30))) - mouseX)) + ((y - (diameter/2 * sin(radians(30)))- mouseY) * (y- (diameter/2 * sin(radians(30)))-mouseY))) < 20) {
        focusIndex--;
        return  true;
      }
    }
    return false;
  }
}



void keyPressed() {
  if (key == 'n') {
    Window window = new Window(500, width/2, height/2);
    focusIndex ++;
    windows.add(window);
  } else if (key == CODED) {
    if (keyCode == ESC) {
      exit();
    }
  }
}