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
    
    if (mousePressed && window.mouseOnCloseButton()) {
      windows.remove(i);
      if (i < focusIndex) {
        focusIndex--;
      } else if (i == focusIndex) {
        focusIndex--;
      }
      i--;
      continue;
    }
    
    if (!(windows.get(focusIndex).mouseInWindow()) && window.mouseInWindow() && mousePressed) {
      focusIndex = i;
    }
    if ((i == focusIndex) && window.mouseInWindow()) {
      window.dragWindow();
      window.rotateWindow();
    } else {
      window.drawWindow();
    }
  }

  if (focusIndex != -1) {
    windows.get(focusIndex).drawWindow();
  }
}

class Window {
  float rotation = 0;
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
    ellipse(x + (diameter/2 * cos(radians(45)+ rotation)), y - (diameter/2 * sin(radians(45)+ rotation)), 40, 40 );
    ellipse(x + (diameter/2 * cos(radians(30)+ rotation)), y - (diameter/2 * sin(radians(30)+ rotation)), 40, 40 );
    ellipse(x + (diameter/2 * cos(radians(60)+ rotation)), y - (diameter/2 * sin(radians(60)+ rotation)), 40, 40 );
    fill(255);
    ellipse(x, y, diameter - 5, diameter - 5);
    fill(255, 140, 0);
    ellipse(x + (diameter/2 * cos(radians(225)+rotation)), y - (diameter/2 * sin(radians(225)+rotation)), 40, 40 );
  }

  boolean mouseInWindow() {
    if (sqrt(((x - mouseX) * (x - mouseX)) + ((y - mouseY) * (y-mouseY))) < (diameter/2)) {
      return true;
    } else {
      return false;
    }
  }
  boolean mouseOnOrangeButton() {
    if (sqrt(pow((x + (diameter/2 * cos(radians(225))) - mouseX), 2)+ pow((y - (diameter/2 * sin(radians(225))) - mouseY), 2))< 20) {
      return true;
    } else {
      return false;
    }
  }

  boolean mouseOnCloseButton() {
    if (sqrt(pow((x + (diameter/2 * cos(radians(30))) - mouseX), 2) + pow((y - (diameter/2 * sin(radians(30)))- mouseY), 2)) < 20) {
      return true ;
    } else {
      return false;
    }
  }

  void dragWindow() {
    if (mousePressed) {
      if (sqrt(((width/2 - mouseX) * (width/2 - mouseX)) + ((height/2 - mouseY) * (height/2-mouseY))) < (height/2)-(diameter/2)) {
        x = mouseX;
        y = mouseY;
        pushMatrix();
        translate(x, y);
        popMatrix();
      }
    }
  }



  void rotateWindow() {
    if (mousePressed) {
      rotation = (x-mouseX) / sqrt(pow(x-mouseX, 2)+pow(y-mouseY, 2));
      pushMatrix();
      rotate(rotation);
      popMatrix();
    }
  }

}



void keyPressed() {
  if (key == 'n') {
    Window window = new Window(500, width/2, height/2);
    if ( focusIndex == -1) {
      focusIndex = 0;
    }
    windows.add(window);
  } else if (key == CODED) {
    if (keyCode == ESC) {
      exit();
    }
  }
}


