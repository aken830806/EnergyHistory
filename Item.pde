class Item{
  PFont font;
  String title;
  PImage img;
  float x = 10;
  float y = 496 +(itemRow-1)*40;
  float width;
  float height = 30;
  float initX,initY;
  boolean locked = false;
  float xOffset = 0.0; 
  float yOffset = 0.0;
  String belong;
  
  Item(String title){
    this.title = title;
    img = loadImage("img/fire.png");
    if(items.size()>0)
      this.x += items.get(items.size()-1).x+items.get(items.size()-1).width;
    if(x + this.width > 600){
      x = 10;
      y += height + 10;
      itemRow += 1;
    }
    initX = x;
    initY = y;
    
  }
  Item(String title,String belong){
    this(title);
    this.belong = belong;
    ansNum += 1;
  }

  void getSize(){
    if(width == 0 || height == 0){
      width = img.width;
      height = img.height;
      println(img.width);
    }
  }
  
  void setPositon(float x,float y){
    this.x = x;
    this.y = y;
  }
  void display(){
    image(img, x, y);
  }
  boolean isTouch(){
    if(mouseX > x & mouseX < x+width &
      mouseY > y & mouseY < y+height){
      xOffset = mouseX-x; 
      yOffset = mouseY-y;
      return true;
    }else{
      return false;
    } 
  }
  void move(){
    x = mouseX - xOffset;
    y = mouseY - yOffset;
  }
  void reset(){
    x = initX;
    y = initY;
  }
}
