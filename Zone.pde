class Zone{
  String title;
  float x;
  float y;
  float width;
  float height;
  PFont font;
  
  Zone(String title,float x,float y,float width,float height){
    this.title = title;
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    font = createFont("Arial",1);
  }
  void display(){
    stroke(0);
    strokeWeight(1);
    
    float w_num = width/2;
    float h_num = height/2;
    
    for (int i = 0; i <= w_num; i++) {//up
      float x = lerp(this.x,this.x + width,i/w_num);
      point(x, y);
    }
    for (int i = 0; i <= w_num; i++) {//down
      float x = lerp(this.x,this.x + width,i/w_num);
      point(x, y+height);
    }
    for (int i = 0; i <= h_num; i++) {//left
      float y = lerp(this.y,this.y + height,i/h_num);
      point(x, y);
    }
    for (int i = 0; i <= h_num; i++) {//right
      float y = lerp(this.y,this.y + height,i/h_num);
      point(x+width, y);
    }
    textAlign(CENTER);// Set the alignment
    fill(0);
    textFont(font,30);
    text(title,x+width/2,y+height/2);
  }
  boolean isInZone(){
    if(mouseX > x & mouseX < x+width &
      mouseY > y & mouseY < y+height)
      return true;
    return false;
  }
}
