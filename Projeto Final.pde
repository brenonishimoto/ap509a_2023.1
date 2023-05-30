void setup(){
  size(400,600);
  background(255);
}

void draw(){
    line(100,0,100,600);
    line(200,0,200,600);
    line(300,0,300,600);
    
    line(0,100,400,100);
    line(0,200,400,200);
    line(0,300,400,300);
    line(0,400,400,400);
    line(0,500,400,500);
    
    //square(25,25,50);
    //triangle(25,75,75,75,50,25);
    //circle(50,50,50);
   
    int shapeType = int(random(3));
    for (int i = 0; i < width; i += 100) {
    for (int j = 0; j < height; j += 100) {
      
      if (shapeType == 2) {
        square(25 + i, 25 + j, 50);
      } else if (shapeType == 1) {
        triangle(25 + i, 75 + j, 75 + i, 75 + j, 50 + i, 25 + j);
      } else if (shapeType == 0) {
        circle(50 + i, 50 + j, 50);
      }
    }
  }
}
