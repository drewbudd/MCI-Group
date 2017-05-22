int x, y, widthCircle; //<>//

int count = 1;
void setup() {
  //start = true;
  size(1024, 768);
  background(255);
}

void draw() {
}

void drawCircle() {
  widthCircle = round(random(1, 6) * 10);
  x = round(random(0 + widthCircle, 1024 - widthCircle));
  y = round(random(0 + widthCircle, 768 - widthCircle));
  noStroke();
  fill(0, 255, 0);
  ellipse(x, y, widthCircle, widthCircle);
}


void keyPressed() {
  if (key == 's' && (count > 0 )) {
    drawCircle();
    count--;
  }
}


void mouseReleased() {

  if (sqrt(((x - mouseX) * (x - mouseX)) + ((y - mouseY) * (y-mouseY)))< (widthCircle/2)) {
    background(255);
    drawCircle();
  }
}