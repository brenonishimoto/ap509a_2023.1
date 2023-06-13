import java.util.ArrayList;

int shapeType;
boolean generated = false;
int lockedX;
int lockedY;
color circleColor = #C0C0C0;
color squareColor = #4B0082;

int[][] grid = new int[12][6];
int cellSize = 100;
float shapeSizePercentage = 0.8;

ArrayList<PVector> squarePositions = new ArrayList<PVector>();
ArrayList<PVector> circlePositions = new ArrayList<PVector>();

int forma = 1;

void setup() {
  size(1200, 600);
  background(0);

  // Gera uma figura no início
  generateShapes();
  drawShapes();
  generated = true;
}

void generateShapes() {
  for (int i = 0; i < 12; i++) {
    for (int j = 0; j < 6; j++) {
      grid[i][j] = 1; // 1 representa um quadrado
      squarePositions.add(new PVector(i, j));
    }
  }

  // Escolhe uma posição aleatória para o círculo original
  lockedX = int(random(12));
  lockedY = int(random(6));

  grid[lockedX][lockedY] = 0; // 0 representa um círculo
  circlePositions.add(new PVector(lockedX, lockedY));
}


void drawShapes() {
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      float x = i * cellSize + cellSize / 2;
      float y = j * cellSize + cellSize / 2;
      float shapeSize = cellSize * shapeSizePercentage;

      if (grid[i][j] == 1) {
        fill(squareColor);
        rectMode(CENTER);
        float squareSize = shapeSize * 0.8;
        square(x, y, squareSize);
      } else {
        fill(circleColor);
        ellipseMode(CENTER);
        float circleDiameter = shapeSize * 0.8;
        circle(x, y, circleDiameter);
      }
    }
  }
}

int countSquares() {
  return squarePositions.size();
}

int countCircles() {
  return circlePositions.size();
}

void mouseClicked() {
  int gridX = mouseX / cellSize;
  int gridY = mouseY / cellSize;

  if (gridX >= 0 && gridX < 12 && gridY >= 0 && gridY < 6) {
    if (grid[gridX][gridY] == 0 && forma == 1) {
      // Clique em um círculo - transforma pelo menos um quadrado em círculo
      int numSquaresToConvert = Math.min(int(random(1, 6)), countSquares());
      boolean transformed = false;
      
      if (countCircles() == numSquaresToConvert) {
        numSquaresToConvert = countCircles() - 1;
      }
      if (countCircles() > 1) { // Verifica se restará pelo menos um círculo após a transformação
        for (int i = 0; i < numSquaresToConvert; i++) {
          if (squarePositions.size() > 1) {
            int randomIndex = int(random(squarePositions.size()));
            PVector squarePos = squarePositions.get(randomIndex);
            int squareX = (int) squarePos.x;
            int squareY = (int) squarePos.y;
            grid[squareX][squareY] = 0;
            squarePositions.remove(randomIndex);
            circlePositions.add(squarePos);

            transformed = true;
          }
        }
      }

      // Se nenhuma transformação ocorreu, transforma pelo menos um quadrado
      if (!transformed && squarePositions.size() > 1) {
        int randomIndex = int(random(squarePositions.size()));
        PVector squarePos = squarePositions.get(randomIndex);
        int squareX = (int) squarePos.x;
        int squareY = (int) squarePos.y;

        grid[squareX][squareY] = 0;
        squarePositions.remove(randomIndex);
        circlePositions.add(squarePos);
      }
    } else if (grid[gridX][gridY] == 1 && forma == 0) {
      // Clique em um quadrado - transforma de 1 a 5 círculos em quadrados
      if (countCircles() > 1) { // Verifica se há mais de um círculo para transformar
        int numCirclesToConvert = Math.min(int(random(1, 6)), countCircles());
        if (countSquares() == numCirclesToConvert) {
          numCirclesToConvert--;
        }
        //println(numCirclesToConvert);
        for (int i = 0; i < numCirclesToConvert; i++) {
          if (circlePositions.size() > 1) {
            int randomIndex = int(random(circlePositions.size()));
            PVector circlePos = circlePositions.get(randomIndex);
            int circleX = (int) circlePos.x;
            int circleY = (int) circlePos.y;

            grid[circleX][circleY] = 1;
            circlePositions.remove(randomIndex);
            squarePositions.add(circlePos);
          }
        }
      }
    }
  }
  if (forma == 0 && countCircles() == 1){
    forma = 1;
  }
  else if (forma == 1 && countSquares() == 1){
    forma = 0;
  }
  background(0); // Limpa o plano de desenho
  drawShapes(); // Redesenha as formas após a transformação
}


void draw() {
  // Se as formas não foram geradas ou houve alguma transformação, redesenha as formas
  if (!generated || mouseX != pmouseX || mouseY != pmouseY) {
    background(0); // Limpa o plano de desenho
    drawShapes();
    generated = true;
  }
}
