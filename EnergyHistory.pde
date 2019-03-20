/* @pjs preload="img/background.PNG"; */
PImage backgroundImg;
ArrayList<Zone> zones;
ArrayList<Item> items;
int itemRow = 1;
int touchItem = -1;
Feedback feedback;
int grade = 0;
int ansNum = 0;
boolean showZone = false;

void setup(){
  size(800,600);
  backgroundImg = loadImage("img/background.PNG");
  zones = new ArrayList<Zone>();
  items = new ArrayList<Item>();
  zones.add(new Zone("Zone1",30,150,100,100));
  zones.add(new Zone("Zone2",185,150,100,100));
  zones.add(new Zone("Zone3",330,150,100,100));
  items.add(new Item("img/sun.png","Zone1"));
  items.add(new Item("img/fire.png","Zone2"));
  items.add(new Item("img/ship.png","Zone3"));
}

void draw(){
  noStroke();
  fill(235,240,242);
  rect(0,0,width,height);
  image(backgroundImg,0,0);
  
  if(showZone){
    for(Zone zone:zones){
      zone.display();
    }
  }
  
  for(Item item:items){
    item.getSize();
    item.display();
  }
  
  if(feedback != null)
    feedback.display();
}

void mousePressed(){
  int count = 0;
  for(Item item:items){
    if(!item.locked && item.isTouch()){
      touchItem = count;
    }
    count += 1;
  }
  if(feedback != null && feedback.isClickButton()){
    feedback = null;
    cursor(ARROW);
  }
}

void mouseDragged(){
  if(touchItem != -1)
    items.get(touchItem).move();
}

void mouseReleased(){
  if(touchItem != -1){
    boolean inZone = false;
    for(Zone zone:zones){
      if(zone.isInZone()){
        inZone = true;
        if(zone.title.equals(items.get(touchItem).belong)){//correct
          ansNum -= 1;
          feedback = new Feedback("正確！","black");
          items.get(touchItem).setPositon(zone.x,zone.y);
          items.get(touchItem).locked = true;
        }else{
          feedback = new Feedback("不，它不應該在這。","red");
          items.get(touchItem).reset();
        }
        touchItem = -1;
      }
    }
    if(!inZone)
      items.get(touchItem).reset();
  }
}
