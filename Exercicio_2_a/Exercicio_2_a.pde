void setup (){
size(600,600);
background(229, 221, 192);
}

void draw () {
//desenhando os retângulos
// maior retângulo
rectMode (CENTER);
noStroke();
fill(202,163,73);
rect(300,300,550,550);
//segundo retângulo (inscrito na primeira figura desenhada)
stroke(#FFFFFF);
rect(300,330,450,450);
rectMode (CENTER);
noFill();
//terceiro retângulo (inscrito na segunda figura desenhada)
rectMode (CENTER);
noStroke();
fill(191,133,60);
rect(300,345,350,350);
//o último e menor retângulo (inscrito em todas as formas já desenhadas)
rectMode (CENTER);
stroke(181,86,64);
fill (181,86,64);
rect(300,370,220,220);
}
