int shapeType;
boolean generated = false;
boolean allowCircleClick = true;
boolean allowSquareClick = false;
int lockedX;
int lockedY;
color circleColor = #F25270;
color squareColor = #F279DE;

int[][] grid = new int[4][6];

void setup() {
  size(400, 600);
  background(255);

  // Gera uma figura no início
  generateShapes();
  drawShapes();
  generated = true;
}

void draw() {
  line(100, 0, 100, 600);
  line(200, 0, 200, 600);
  line(300, 0, 300, 600);

  line(0, 100, 400, 100);
  line(0, 200, 400, 200);
  line(0, 300, 400, 300);
  line(0, 400, 400, 400);
  line(0, 500, 400, 500);
}

void generateShapes() {
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 6; j++) {
      grid[i][j] = 1; // 1 representa um quadrado
    }
  }

  // Escolhe uma posição aleatória para o círculo original
  lockedX = int(random(4));
  lockedY = int(random(6));

  grid[lockedX][lockedY] = 0; // 0 representa um círculo
}

void drawShapes() {
  for (int i = 0; i < width; i += 100) {
    for (int j = 0; j < height; j += 100) {
      if (grid[i / 100][j / 100] == 1) {
        fill(squareColor);
        square(25 + i, 25 + j, 50);
      } else if (grid[i / 100][j / 100] == 0) {
        fill(circleColor);
        circle(50 + i, 50 + j, 50);
      }
    }
  }
}

void transformSquaresToCircles() {
  ArrayList<Integer> squareIndices = new ArrayList<Integer>();

  // Encontra quadrados e adiciona seus índices na lista
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 6; j++) {
      if (grid[i][j] == 1) {
        squareIndices.add(i * 6 + j);
      }
    }
  }

  // Verifica se há pelo menos três quadrados
  if (squareIndices.size() >= 3) {
    // Escolhe aleatoriamente três quadrados
    for (int i = 0; i < 3; i++) {
      int randomIndex = int(random(squareIndices.size()));
      int index = squareIndices.get(randomIndex);
      int row = index / 6;
      int col = index % 6;

      grid[row][col] = 0;
      squareIndices.remove(randomIndex);
    }
  } else if (squareIndices.size() > 0) {
    // Transforma apenas um quadrado se houver pelo menos um quadrado
    int randomIndex = int(random(squareIndices.size()));
    int index = squareIndices.get(randomIndex);
    int row = index / 6;
    int col = index % 6;

    grid[row][col] = 0;
  }
}

void transformCirclesToSquares() {
  ArrayList<Integer> circleIndices = new ArrayList<Integer>();

  // Encontra círculos e adiciona seus índices na lista
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 6; j++) {
      if (grid[i][j] == 0) {
        circleIndices.add(i * 6 + j);
      }
    }
  }

  // Escolhe aleatoriamente três círculos
  for (int i = 0; i < 3; i++) {
    if (circleIndices.size() == 0) {
      // Não há mais círculos para transformar em quadrados
      break;
    }
    int randomIndex = int(random(circleIndices.size()));
    int index = circleIndices.get(randomIndex);
    int row = index / 6;
    int col = index % 6;

    grid[row][col] = 1;
    circleIndices.remove(randomIndex);
  }
}

void mouseClicked() {
  if (!generated) {
    generateShapes();
    drawShapes();
    generated = true;
  } else {
    int clickedX = mouseX / 100;
    int clickedY = mouseY / 100;

    if (allowCircleClick && grid[clickedX][clickedY] == 0) {
      transformSquaresToCircles();
      background(255);
      drawShapes();
      if (countSquares() == 1) {
        allowCircleClick = false;
        allowSquareClick = true;
      }
    } else if (allowSquareClick && grid[clickedX][clickedY] == 1) {
      transformCirclesToSquares();
      background(255);
      drawShapes();
      if (countCircles() == 1) {
        allowSquareClick = false;
        allowCircleClick = false;
      }
    }
  }
}

int countSquares() {
  int count = 0;
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 6; j++) {
      if (grid[i][j] == 1) {
        count++;
      }
    }
  }
  return count;
}

int countCircles() {
  int count = 0;
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 6; j++) {
      if (grid[i][j] == 0) {
        count++;
      }
    }
  }
  return count;
}
