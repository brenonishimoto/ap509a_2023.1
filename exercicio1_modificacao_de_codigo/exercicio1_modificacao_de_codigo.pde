void setup () {
  size(600,600);
  background(229, 221, 192);
}
void draw () {
  //desenhando os retângulos
  // maior retângulo
  rectMode (CENTER);
  noStroke();
  fill(255,53,53);
  rect(mouseX,300,mouseY,550);
  //segundo retângulo (inscrito na primeira figura desenhada)
  rectMode (CENTER);
  noStroke();
  fill(153,0,173);
  //terceiro retângulo (inscrito na segunda figura desenhada)
  rectMode (CENTER);
  noStroke();
  fill(81,142,223);
  circle(mouseX,mouseY,350);
  //o último e menor retângulo (inscrito em todas as formas já desenhadas)
  rectMode (CENTER);
  noStroke();
  fill (255,255,255);
  triangle(mouseY,370,220,220,110,110);
  triangle(mouseX,370,220,220,510,510);
}
