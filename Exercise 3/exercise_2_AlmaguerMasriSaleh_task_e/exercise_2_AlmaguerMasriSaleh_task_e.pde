int x, y, widthCircle;
boolean circleDrawn;

void setup() {
  size(1024, 768);
  background(255);
  circleDrawn = false;
  drawCircle();
}

void draw() {
  drawCircle();
}

void drawCircle() {
  if (!circleDrawn) {
    circleDrawn = true;
    widthCircle = 20;
    x = round(random(0 + widthCircle, 1024 - widthCircle));
    y = round(random(0 + widthCircle, 768 - widthCircle));
    noStroke();
    ellipse(x, y, widthCircle, widthCircle);
    fill(0, 255, 0);
  }
}