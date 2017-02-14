function setup() {
  var canvas = createCanvas(windowWidth, windowHeight);
}

function draw() {
  background(0);
  translate(windowWidth/2, windowHeight/2);
  rotate(frameCount*0.1); //how fast does it go around?
  for (i=0; i<600; i = i+1) {
    rotate(PI*700/400/60);
    strokeWeight((mouseX*1.5+windowWidth/2)/windowWidth*i/12);
    stroke(map(mouseY,0,windowHeight,0,255),map(i, 0, 300, 0, 255),200,100);
    line(0, i*100, 0, i+310/100);   
  }
}
