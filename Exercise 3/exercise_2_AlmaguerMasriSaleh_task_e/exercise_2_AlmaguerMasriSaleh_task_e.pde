int count = 1;
int x, y, widthCircle; //<>//
int newX, newY;
double distance;
int ms;

void setup() {
  //start = true;
  size(1024, 768);
  background(255);
  frameRate(1000);
  textSize(20);
  ms = 0;
}

void draw() {
  ms ++;
  if (ms % 50 == 0){
    background(255);
    text(ms, 10, 80);
  }

}

void drawCircle() {
  
  ms = 0;
  widthCircle = round(random(1, 6) * 10);
  
  if (count < 1) {
    do {
      newX = round(random(0 + widthCircle, 1024 - widthCircle));
      newY = round(random(0 + widthCircle, 768 - widthCircle));
      distance = sqrt(pow(abs(x-newX),2)+pow(abs(y-newY),2));
    } while (distance < 30);
    
    text(x-newX, 10, 10);
    text(y-newY, 10, 20);
  
    x = newX;
    y = newY;    
  } else {
    x = round(random(0 + widthCircle, 1024 - widthCircle));
    y = round(random(0 + widthCircle, 768 - widthCircle));
  }
  
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
    text (ms , 10 , 50);
    drawCircle();

  }
}