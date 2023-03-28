void setup (){
size(600,600);
background(#FFFFFF);
}

void draw () {
//desenhando os retângulos
// maior retângulo
rectMode (CENTER);
noStroke();
fill(#6a6a6a);
rect(300,300,550,550);
//segundo retângulo (inscrito na primeira figura desenhada)
noStroke();
fill(#545454);
rect(300,330,450,450);
rectMode (CENTER);
noFill();
//terceiro retângulo (inscrito na segunda figura desenhada)
rectMode (CENTER);
noStroke();
fill(#3f3f3f);
rect(300,345,350,350);
//o último e menor retângulo (inscrito em todas as formas já desenhadas)
rectMode (CENTER);
stroke(#FFFFFF);
fill (#2c2c2c);
rect(300,370,220,220);
}
