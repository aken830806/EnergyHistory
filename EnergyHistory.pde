/* @pjs preload="img/background.PNG"; */
PImage backgroundImg;
ArrayList<Zone> zones;
ArrayList<Item> items;
int itemRow = 1;
int touchItem = -1;
Feedback feedback;
int grade = 0;
int ansNum = 0;

interface JavaScript{
  void showGrade(String lab_id,String grade);
}

void bindJavaScript(JavaScript js){
  javascript = js;
}

JavaScript javascript;

void setup(){
  size(600,700);
  backgroundImg = loadImage("img/background.PNG");
  zones = new ArrayList<Zone>();
  items = new ArrayList<Item>();
  zones.add(new Zone("The Top Zone",160,30,196,178));
  zones.add(new Zone("The Middle Zone",86,210,340,138));
  zones.add(new Zone("The Bottom Zone",15,350,485,135));
  items.add(new Item("img/fire.png","The Top Zone"));
  // items.add(new Item("Goes to the middle","The Middle Zone"));
  // items.add(new Item("Goes to the bottom","The Bottom Zone"));
  // items.add(new Item("Goes anywhere"));
  // items.add(new Item("I don't belong anywhere"));
}

void draw(){
  noStroke();
  fill(235,240,242);
  rect(0,0,width,height);
  image(backgroundImg,0,0);
  
  for(Zone zone:zones){
    zone.display();
  }
  for(Item item:items){
    item.display();
  }
  
  if(feedback != null)
    feedback.display();
}

void mousePressed(){
  int count = 0;
  for(Item item:items){
      item.getSize();
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
          if(javascript != null && ansNum <= 0){
            javascript.showGrade("test1","1");
          }
          feedback = new Feedback("Correct! This one belongs to "+zone.title,"black");
          items.get(touchItem).setPositon(260-items.get(touchItem).width/2,zone.y);
          items.get(touchItem).locked = true;
        }else{
          feedback = new Feedback("No, this item does not belong here. Try again.","red");
          items.get(touchItem).reset();
        }
        touchItem = -1;
      }
    }
    if(!inZone)
      items.get(touchItem).reset();
  }
}
