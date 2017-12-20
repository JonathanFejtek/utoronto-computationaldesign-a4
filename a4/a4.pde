import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;
int uCount = 256;
int vCount = 64;

PVector[][] points = new PVector[uCount+1][vCount+1];
ArrayList<PolyFace> faces = new ArrayList<PolyFace>();

void setup(){
  size(1200,900,P3D);
  colorMode(HSB,255);
    cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(2000);
  
  
  for(int u = 0; u <= uCount; u++){
    for(int v = 0; v <= vCount; v++){
      float iu = map(u,0,uCount,0,TWO_PI);
      float iv = map(v,0,vCount,0,TWO_PI);
            
      float theta = iu;
      float THETA = iv;
      
      int a = 7;
      int b = 3;

      float r = 10;
      float R = map(cos(a*(theta-PI/2)),-1,1,75,100);
      float R2 = map(cos(a*(theta-PI/2)),-1,1,75,100);
      
      float x = (R+r*cos(THETA))*cos(b*(theta));
      float y = (R2+r*cos(THETA))*sin(b*theta);
      float z = r*sin(THETA)+(r*5)*cos(a*theta);
      
      points[u][v] = new PVector(x,y,z);
      
    }
  }
  
    for(int u = 1; u <= uCount; u++){
    for(int v = 1; v <= vCount; v++){
      
      PVector p1 = points[u][v];
      PVector p2 = points[u][v-1];
      PVector p4 = points[u-1][v-1];
      PVector p3 = points[u-1][v];
      
      PolyFace new_face = new PolyFace(p1,p2,p3,p4);
      
      float ui = map(u,0,uCount,0,TWO_PI);
      float vi = map(v,0,vCount,0,TWO_PI);
      
      float hue = map(sin(2*(ui))+cos(4*(vi)),-1,1,200,210);
      float sat = map(sin(10*(vi))+cos(10*(ui)),-1,1,100,255);
      float bright = map(sin(15*(vi))+cos(10*(ui)),-1,1,50,250);
      
      new_face.setColor(color(hue,sat,bright));
      faces.add(new_face);
    }
  }
 
}

void draw(){
  background(0);
  for(PolyFace f : faces){
    f.display();
  }
  
}
int img = 4;
void keyPressed(){
  if(key == 's'){
    save("im" + str(img) + ".jpg");
    img++;
  }
  
}