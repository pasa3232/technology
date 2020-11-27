int RX, GX, BX, RY, GY, BY, circleSize;    // botton
int circleColor, circleHighlight;          // botton
boolean ROver=false, GOver=false, BOver=false;  // botton
boolean R=false, G=false, B=false;         // botton
boolean[] showing = new boolean[16];

int afterpress=0;

int x=645, y=445, invert=170, r=850;       // rgb
Images[] images = new Images[16];     //images

void set_images(){
  
  // R&G&B
  images[0] = new Images("RGB1.png");
  images[9] = new Images("RGB2.png");
  // G
  images[1] = new Images("Gundam.png");
  images[10] = new Images("G.png");
  // G&B
  images[2] = new Images("GB1.png");
  images[12] = new Images("GB2.png");
  // B
  images[3] = new Images("B1.png");
  images[8] = new Images("B2.png");
  images[15] = new Images("B3.png");
  // R&B
  images[4] = new Images("BR1.png");
  images[7] = new Images("BR2.png");
  images[11] = new Images("BR3.png");
  // R&G
  images[5] = new Images("RG.png");
  images[14] = new Images("RG2.png");
  // R
  images[6] = new Images("sleep.png");
}

void setup(){
  size(1920, 1080);
  textSize(25);
  textAlign(CENTER,CENTER);
  set_images();
  RX = GX = BX = 1700;
  RY = 200;
  GY = 1080/2;
  BY = 880;
  circleSize = 200;
  circleColor = 255;
  circleHighlight = 204;
  for(int i=0; i<9; i++) showing[i]=false;
}

void fillw(int type){
  fill(255);
  stroke(255);
  if(type==0) // R
    ellipse(x, y, r, r);
  else if(type==1)
    ellipse(x+invert/sqrt(3), y+invert, r, r);
  else
    ellipse(x+2*invert/sqrt(3), y, r, r);
}

void fillrgb(int type){
  if(type==0){ // R
    fill(255, 0, 0, 100);
    stroke(255, 0, 0, 100);
    ellipse(x, y, r, r);    
  }
  else if(type==1){
    fill(0, 255, 0, 100);
    stroke(0, 255, 0, 100);
    ellipse(x+invert/sqrt(3), y+invert, r, r);
  }
  else{
    fill(0, 0, 255, 100);
    stroke(0, 0, 255, 100);
    ellipse(x+2*invert/sqrt(3), y, r, r);
  }
}

void fill_RGB(){
  if(R) fillw(0);
  if(G) fillw(1);
  if(B) fillw(2);
  if(R) fillrgb(0);
  if(G) fillrgb(1);
  if(B) fillrgb(2);
}

void button(){
  
  if (ROver) {
    fill(circleHighlight, 0, 0);
  } else {
    fill(circleColor, 0, 0);
  }
  stroke(0);
  ellipse(RX, RY, circleSize, circleSize);
  fill(0, 255, 255);
  text("LESS TIME", RX, RY);
  
  if (GOver) {
    fill(0, circleHighlight, 0);
  } else {
    fill(0, circleColor, 0);
  }
  stroke(0);
  ellipse(GX, GY, circleSize, circleSize);
  fill(255, 0, 255);
  text("LESS MONEY", GX, GY);
  
  if (BOver) {
    fill(0, 0, circleHighlight);
  } else {
    fill(0, 0, circleColor);
  }
  stroke(0);
  ellipse(BX, BY, circleSize, circleSize);
  fill(255, 255, 0);
  text("COVID-19", BX, BY);
}

void checkshowing(){
  /**
  R: x, y
  G: x+invert/sqrt(3), y+invert
  B: x+2*invert/sqrt(3), y
  **/
  for(int i=0; i<16; i++) showing[i]=false;
  // R&G&B
  if(R&G&B){
    showing[0]=showing[9]=true;
    images[0].set_pos(x+invert/sqrt(3), y+invert/3);
    images[9].set_pos(x+invert/sqrt(3), y+invert/3);
  }
  else if(R&!G&!B){
    showing[0]=showing[9]=showing[4]=showing[5]=showing[6]=showing[7]=showing[11]=showing[14]=true;
    images[0].set_pos(x, y);
    images[9].set_pos(x, y);
    images[5].set_pos(x, y);
    images[4].set_pos(x, y);
    images[7].set_pos(x, y);
    images[6].set_pos(x, y);
    images[11].set_pos(x, y);
    images[14].set_pos(x, y);
  }
  else if(!R&G&!B){
    showing[0]=showing[1]=showing[2]=showing[5]=showing[9]=showing[10]=showing[12]=showing[14]=true;
    images[0].set_pos(x+invert/sqrt(3), y+invert);
    images[1].set_pos(x+invert/sqrt(3), y+invert);
    images[2].set_pos(x+invert/sqrt(3), y+invert);
    images[5].set_pos(x+invert/sqrt(3), y+invert);
    images[9].set_pos(x+invert/sqrt(3), y+invert);
    images[10].set_pos(x+invert/sqrt(3), y+invert);
    images[12].set_pos(x+invert/sqrt(3), y+invert);
    images[14].set_pos(x+invert/sqrt(3), y+invert);
  }
  else if(!R&!G&B){
    showing[0]=showing[2]=showing[4]=showing[7]=showing[3]=showing[8]=showing[9]=showing[12]=showing[11]=showing[15]=true;
    images[0].set_pos(x+2*invert/sqrt(3), y);
    images[2].set_pos(x+2*invert/sqrt(3), y);
    images[3].set_pos(x+2*invert/sqrt(3), y);
    images[8].set_pos(x+2*invert/sqrt(3), y);
    images[4].set_pos(x+2*invert/sqrt(3), y);
    images[7].set_pos(x+2*invert/sqrt(3), y);
    images[9].set_pos(x+2*invert/sqrt(3), y);
    images[12].set_pos(x+2*invert/sqrt(3), y);
    images[11].set_pos(x+2*invert/sqrt(3), y);
    images[15].set_pos(x+2*invert/sqrt(3), y);
  }
  else if(R&G&!B){
    showing[0]=showing[5]=showing[9]=showing[14]=true;
    images[0].set_pos(x+invert/sqrt(3)/2, y+invert/2);
    images[5].set_pos(x+invert/sqrt(3)/2, y+invert/2);
    images[9].set_pos(x+invert/sqrt(3)/2, y+invert/2);
    images[14].set_pos(x+invert/sqrt(3)/2, y+invert/2);
  }
  else if(R&!G&B){
    showing[0]=showing[4]=showing[7]=showing[9]=showing[11]=true;
    images[0].set_pos(x+invert/sqrt(3), y);
    images[4].set_pos(x+invert/sqrt(3), y);
    images[7].set_pos(x+invert/sqrt(3), y);
    images[9].set_pos(x+invert/sqrt(3), y);
    images[11].set_pos(x+invert/sqrt(3), y);
  }
  else if(!R&G&B){
    showing[0]=showing[2]=showing[9]=showing[12]=true;
    images[0].set_pos(x+3*invert/sqrt(3)/2, y+invert/2);
    images[2].set_pos(x+3*invert/sqrt(3)/2, y+invert/2);
    images[9].set_pos(x+3*invert/sqrt(3)/2, y+invert/2);
    images[12].set_pos(x+3*invert/sqrt(3)/2, y+invert/2);
  }
}

void draw(){
  if(afterpress!=0) afterpress++;
  if(afterpress==10){R=!R;checkshowing();afterpress=0;}
  if(afterpress==20){G=!G;checkshowing();afterpress=0;}
  if(afterpress==30){B=!B;checkshowing();afterpress=0;}
  update();
  background(0);
  button();
  fill_RGB();
  for(int i=0; i<16; i++){
    if(showing[i]){
      if(R) images[i].check(x, y, r/2);
      if(G) images[i].check(x+invert/sqrt(3), y+invert, r/2);
      if(B) images[i].check(x+2*invert/sqrt(3), y, r/2);
      images[i].move();
      images[i].draw_img(afterpress);
    }
  }
}

void update() {
  if ( overCircle(RX, RY, circleSize) ) {
    ROver = true;
    GOver = false;
    BOver = false;
  } else if ( overCircle(GX, GY, circleSize) ) {
    ROver = false;
    GOver = true;
    BOver = false;
  } else if ( overCircle(BX, BY, circleSize) ) {
    ROver = false;
    GOver = false;
    BOver = true;
  } else {
    ROver = GOver = BOver = false;
  }
}

void mousePressed() {
  if (ROver) afterpress=1;
  if (GOver) afterpress=11;
  if (BOver) afterpress=21;
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
