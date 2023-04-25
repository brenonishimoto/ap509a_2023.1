void setup() {
size(600,800);
background(255);
}

void draw() {
}

void mouseDragged() {
float r = map(mouseX, 100, width, 50, 150);
float s = map(mouseY, 60, width, 0, 200);
float b = map(mouseX, 0, width, 30, 180);
color cor = color(r,s,b);
fill(cor);
float raio = dist(mouseX, mouseY, pmouseX, pmouseY);
square(mouseX, mouseY, raio);

}
