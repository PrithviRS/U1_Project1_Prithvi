/*
Hi, welcome to my project.
 
 
 This project is an interactive 3D art exhibition.
 
 TO DO:
 Make an array for sphere location, so multiple spheres are drawn.
 Make a translation code that randomises the sphere location in relation to the origin.
 Add music. (Non Copyright Sounds).
 Create a (or many) if statements that switch between object type (box, sphere, etc.)
 Add in a key to switch background colours.
 
 
 
 TO RESEARCH:
 Try to add in a graphing type of some sort; Mathematically generated patterns ETC.
 */



import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;
PeasyCam cam;
float objectSize = 10;
boolean boxParameters = false;
boolean sphereParameters = false;
float colourR = 100;
float colourG = 100;
float colourB = 100;
float[] spheres;
void setup() 
{ 
  //frameRate(0.5);
  fullScreen(P3D);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  spheres = new float[60];
}
void draw() 
{
  for (int i = 0; i < 60; i++) 
  {
    rotateX(-.5);
    rotateY(-.5);
    background(0);
  }
  fill(colourR, colourG, colourB);
  //sphere(objectSize);
  pushMatrix();
  translate(0, 0, 0);
  popMatrix();
  translate(random(255), random(255), 0);
  sphere(objectSize);
 translate(random(255), random(255), 0);
 sphere(objectSize);
 translate(random(255), random(255), 0);
 sphere(objectSize);
  
}


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

void makeBox()
{
  background(0, 0, 0);
  box(objectSize);
}
void makeSphere()
{
  background (0, 0, 0);
  sphere(objectSize);
}