public class Images{
  final static byte  MAX_SPD = 5;
  PImage img;
  float posx, posy;
  float  spX, spY;
  int img_size;
  Images(String url){
    img = loadImage("data/"+url);
    img_size = 160;
    img.resize(img_size, img_size);
  }
  void set_pos(float posx, float posy){
    this.posx = posx;
    this.posy = posy;
    spX = random(1, MAX_SPD + 1);
    if (random(1) < .5)   spX *= -1;
 
    // Ternary operator ?: which demands 3 operands.
    // If random(1) < .5, multiplies by -1, otherwise by 1:
    spY = ( random(1, MAX_SPD + 1) * (random(1) < .5 ? -1:1) );
  }
  void draw_img(int tint){
    tint%=10;
    tint(255, tint==0?230:(10-tint)*230/10);
    image(img, posx - img_size/2, posy - img_size/2);
  }
  void check(float x, float y, float r){
    float X = posx+spX;
    float Y = posy+spY;
    if((X-x)*(X-x)+(Y-y)*(Y-y)>=(r-img_size/2)*(r-img_size/2)){
      PVector v1, v2, v3, v4, v5;
      v1 = new PVector(posx-x, posy-y);
      v2 = new PVector(spX, spY);
      v3 = PVector.mult(v1, PVector.dot(v1, v2)/PVector.dot(v1, v1));
      v4 = PVector.sub(v2, v3);
      v5 = PVector.sub(v4, v2);
      spX = v5.x;
      spY = v5.y;
    }
  }
  void move(){
    posx+=spX;
    posy+=spY;
  }
}
