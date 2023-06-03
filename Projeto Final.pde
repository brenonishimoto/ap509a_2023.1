int shapeType;
boolean generated = false;
int lockedX;
int lockedY;
color circleColor = #F25270;
color triangleColor = #04D9B2;
color squareColor = #F279DE;

void setup() {
  size(400, 600);
  background(255);
  
  // Gera uma figura no início
  shapeType = int(random(3));
  lockedX = int(random(4));
  lockedY = int(random(6));
  drawShapes();
  generated = true;
}

void draw() {
  //line(100, 0, 100, 600);
  //line(200, 0, 200, 600);
  //line(300, 0, 300, 600);
  
  //line(0, 100, 400, 100);
  //line(0, 200, 400, 200);
  //line(0, 300, 400, 300);
  //line(0, 400, 400, 400);
  //line(0, 500, 400, 500);
}

void drawShapes() {
  for (int i = 0; i < width; i += 100) {
    for (int j = 0; j < height; j += 100) {
      if (shapeType == 2) {
        if (i / 100 == lockedX && j / 100 == lockedY) {
          fill(squareColor);
          square(25 + i, 25 + j, 50);
        } else {
          fill(circleColor);
          circle(50 + i, 50 + j, 50);
        }
      } else if (shapeType == 1) {
        if (i / 100 == lockedX && j / 100 == lockedY) {
          fill(circleColor);
          circle(50 + i, 50 + j, 50);
        } else {
          fill(triangleColor);
          triangle(25 + i, 75 + j, 75 + i, 75 + j, 50 + i, 25 + j);
        }
      } else if (shapeType == 0) {
        if (i / 100 == lockedX && j / 100 == lockedY) {
          fill(triangleColor);
          triangle(25 + i, 75 + j, 75 + i, 75 + j, 50 + i, 25 + j);
        } else {
          fill(squareColor);
          square(25 + i, 25 + j, 50);
        }
      }
    }
  }
}

void mouseClicked() {
  if (!generated) {
    shapeType = int(random(3));
    lockedX = int(random(4));
    lockedY = int(random(6));
    drawShapes();
    generated = true;
  } else {
    int clickedX = mouseX / 100;
    int clickedY = mouseY / 100;
    if (clickedX == lockedX && clickedY == lockedY) {
      shapeType = (shapeType + 1) % 3;
      background(255);
      drawShapes();
    }
  }
}
