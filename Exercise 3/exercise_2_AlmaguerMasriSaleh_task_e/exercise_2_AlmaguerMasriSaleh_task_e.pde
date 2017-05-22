int count = 1; //<>//

int x, y, widthIndex; //<>//
int newX, newY;
double distance;
ArrayList<Integer> sizes = new ArrayList<Integer>();

void setup() {
  //start = true;
  size(1024, 768);
  background(255);
  generateArray();
}

void draw() {
}

void drawCircle() {
  widthIndex = round(random(0, sizes.size()-1));
  
  if (count < 1) {
    do {
      newX = round(random(0 + sizes.get(widthIndex), 1024 - sizes.get(widthIndex)));
      newY = round(random(0 + sizes.get(widthIndex), 768 - sizes.get(widthIndex)));
      distance = sqrt(pow(abs(x-newX),2)+pow(abs(y-newY),2));
    } while (distance < 30);
    
    text(x-newX, 10, 10);
    text(y-newY, 10, 20);
    text(sizes.get(widthIndex), 10, 30);
    text(sizes.size(), 10, 40);
  
    x = newX;
    y = newY;
    
    sizes.remove(widthIndex);
  } else {
    x = round(random(0 + sizes.get(widthIndex), 1024 - sizes.get(widthIndex)));
    y = round(random(0 + sizes.get(widthIndex), 768 - sizes.get(widthIndex)));
  }
  
  noStroke();
  fill(0, 255, 0);
  ellipse(x, y, sizes.get(widthIndex), sizes.get(widthIndex));
}


void keyPressed() {
  if (key == 's' && (count > 0 )) {
    drawCircle();
    count--;
  }
}


void mouseReleased() {

  if (sqrt(((x - mouseX) * (x - mouseX)) + ((y - mouseY) * (y-mouseY)))< (sizes.get(widthIndex)/2)) {
    background(255);
    drawCircle();
  }
}

void generateArray() {
  for (int i = 5; i < 30; i += 5) {
    int twenty = 20;
    while (twenty > 0) {
      sizes.add(i);
      twenty--;
    }
  }
}