class Feedback{
  String title;
  String feedColor;
  PFont font;
  int spacing = 30;
  int extent = 20;
  int circleX = width-spacing-extent;
  int circleY = spacing+extent;
  
  Feedback(String title,String feedColor){
    this.title = title;
    this.feedColor = feedColor;
    font = createFont("Arial",1);
    font = createFont("細明體",1);
  }
  void display(){
    noStroke();
    switch(feedColor){
      case "red":
        fill(189,61,61,220);
        stroke(189,61,61);
        break;
      case "black":
        fill(0,170);
        stroke(0);
        break;
    }
    
    rect(spacing,spacing,width-spacing*2,80);
    fill(255);
    
    ellipse(circleX,circleY,extent,extent);
    strokeWeight(3);
    int divide = 6;
    line(circleX-extent/divide,circleY-extent/divide,circleX+extent/divide,circleY+extent/divide);
    line(circleX-extent/divide,circleY+extent/divide,circleX+extent/divide,circleY-extent/divide);
    
    textAlign(LEFT);
    textFont(font,20);
    fill(255);
    text(title,30,70);
    if(mouseX > circleX-extent/2 & mouseX < circleX+extent/2 &
      mouseY > circleY-extent/2 & mouseY < circleY+extent/2){
      cursor(HAND);
    }
    else
      cursor(ARROW);
  }
  boolean isClickButton(){
    if(mouseX > circleX-extent/2 & mouseX < circleX+extent/2 &
      mouseY > circleY-extent/2 & mouseY < circleY+extent/2){
      return true;
    }
    else
      return false;
  }
}
