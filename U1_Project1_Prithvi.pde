/*
Hi, welcome to the Art Space by Prithvi.
 
 
 This project is an interactive 3D art exhibition.
 
 TO DO:
 --Make an array for sphere location, so multiple spheres are drawn.
 ^^ (similar)Make a translation code that randomises the sphere location in relation to the origin.
 Add music. (Non Copyright Sounds).
 Create a (or many) if statements that switch between object type (box, sphere, etc.)
 Add in a key to switch background colours.
 
 
 */

//Minim Library
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//importing peasycam
import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;
PeasyCam cam;
//declaring my variables
float objectSize = 10;
boolean boxParameters = false;
boolean sphereParameters = true;
float colourR = 10;
float colourG = 255;
float colourB = 10;
float[] sphereArray;
float yRotate;
void setup() 
{ 
  //setting up screensize, peasycam.
  fullScreen(P3D);
  background(0);
  cam = new PeasyCam(this, 1000);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);

  sphereArray = new float[100];
}
void draw() 
{
  if(sphereParameters == true)
  {
  //creating the shapes.
  fill(random(255), random(255), random(255));
  stroke(random(255), random(255), random(255));
  //sphere(objectSize);
  rotateY(yRotate);
  yRotate += 100;
  
  
  
  }
  if(sphereParameters == false)
  {
   fill(colourR, colourG, colourB); 
  }
  pushMatrix();
  popMatrix();
  //if statements to toggle object creation. I did this because I want the objects to continuously draw while the parameters are true, and when they're false, I want the other shape to start drawing instead. 
if(boxParameters == true)
{
 sphereParameters = false;
 makeBox();
}
if(sphereParameters == true)
{
for (float i = 0; i < 100; i++)
{
 translate(10,10,10);
  sphere(0.75);
  translate(random(i), random(i), random(i));
  
}
}
}


//keypressed commands. These are to code the arrow keys to change the object values.
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      objectSize += 10;
    }
  }
  if (keyCode == DOWN)
  {
    objectSize -= 10;
  }
if(boxParameters == true)
  {
  if (keyCode == LEFT) 
  {
    stroke(random(255), random(255), random(255));
    colourR *= 0; 
    colourR += random(255);
    colourG *= 0; 
    colourG += random(255);
    colourB *= 0; 
    colourB += random(255);
    
  } 
  }
  if (keyCode == RIGHT)
  {
    if(boxParameters == false)
    {
     boxParameters = true; 
    }  
    }
    if (keyCode == ENTER)
    {
      if(boxParameters == true)
      {
       boxParameters = false;
       sphereParameters = true;
       background(0);
      }
    }
    
  }


//custom function
void makeBox()
{
  background(0);
  box(objectSize);
}