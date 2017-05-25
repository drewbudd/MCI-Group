int count = 1;
int x, y, widthIndex; //<>//
int newX, newY;
double distance;
int mStart, msEnd;
ArrayList<Integer> singleTest = new ArrayList<Integer>();
ArrayList<ArrayList<Integer>> evaluation = new ArrayList<>();
int currentDiameter;
ArrayList<Integer> sizes = new ArrayList<Integer>();

void setup() {
  //start = true;
  size(1024, 768);
  background(255);
  textSize(20);
  generateArray();
}

void draw() {
}

void drawCircle() {
  if (sizes.size() == 0) {
    background(255);
    text("DONE", 500, 30);
    return;
  }
  
  mStart = millis();
  text(mStart, 10, 600);
  widthIndex = floor(random(0, sizes.size()-1));
  noStroke();
  fill(0, 255, 0);
  
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
  } else {
    x = round(random(0 + sizes.get(widthIndex), 1024 - sizes.get(widthIndex)));
    y = round(random(0 + sizes.get(widthIndex), 768 - sizes.get(widthIndex)));
  }
  
  currentDiameter = sizes.get(widthIndex);
  ellipse(x, y, currentDiameter, currentDiameter);
  sizes.remove(widthIndex);
}


void keyPressed() {
  if (key == 's' && (count > 0 )) {
    drawCircle();
    count--;
  }
  
  
}


void mouseReleased() {

  if (sqrt(((x - mouseX) * (x - mouseX)) + ((y - mouseY) * (y-mouseY)))< (currentDiameter/2)) {
    msEnd = millis();
    int deltaTime = msEnd - mStart;
    singleTest.add(deltaTime);
    singleTest.add(new Double(distance).intValue());
    evaluation.add(singleTest);
    singleTest.clear();
    background(255);
    text(deltaTime, 500, 500);
    drawCircle();

  }
}
  
  void generateArray() {
  ArrayList<Integer> diameters = new ArrayList();
  diameters.add(10);
  diameters.add(20);
  diameters.add(40);
  diameters.add(60);
  diameters.add(100);
  
  for (Integer diameter : diameters) {
    int twenty = 20;
    while (twenty > 0) {
      sizes.add(diameter);
      twenty--;
    }
  }
}