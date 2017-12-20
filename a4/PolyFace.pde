class PolyFace{
  PShape triangle1;
  PShape triangle2;
  color fill;
  
  PolyFace(PVector p1, PVector p2, PVector p3, PVector p4){
    triangle1 = createShape();
    triangle2 = createShape();
    
    triangle1.beginShape();
    triangle1.vertex(p1.x,p1.y,p1.z);
    triangle1.vertex(p2.x,p2.y,p2.z);
    triangle1.vertex(p3.x,p3.y,p3.z);
    triangle1.endShape();
    
    triangle2.beginShape();
    triangle2.vertex(p2.x,p2.y,p2.z);
    triangle2.vertex(p3.x,p3.y,p3.z);
    triangle2.vertex(p4.x,p4.y,p4.z);
    triangle2.endShape();
    
    triangle1.disableStyle();
    triangle2.disableStyle();
  }
  
  void setColor(color c){
    this.fill = c;
  }
  
  void display(){
   // fill(random(250));
   pushStyle();
   noStroke();
   fill(this.fill);
    shape(triangle1);
    shape(triangle2);
    popStyle();
  }
  
}