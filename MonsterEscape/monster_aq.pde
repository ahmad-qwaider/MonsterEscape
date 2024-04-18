PImage img;
PImage img2;
Monster monster;
followers[] speck;
int repeat = 0;
int dead = 0;
int spacing = 10;
float[] Dist;
String mode[] = {"Easy","Normal","Hard"};
int index =0;
int savei;
int x[] = {50,400,750};
boolean start =false;
int onetime=0;
int happened = 0;
int just2 = 0;
void setup()
{
  background(255);
  size(1000, 900, P2D);
  monster = new Monster();
  img = loadImage("Dark.jpg");
  img2 = loadImage("darkgray.jpg");
}

void draw()
{
  
  if(start == false)
  {
  
  image(img, 0, 0, width, height);
  choice(index);
  }
  else
  {
  image(img2, 0, 0, width, height);
  if(onetime == 0)
  {
   initiallize(); 
  }
  Nearest();
  monster.drawme();
    for(int i =0; i<speck.length; i++)
  {
   speck[i].drawme(); 
   speck[i].update(); 
  }
 house();
   if(dead==speck.length)
   {
     fill(255);
     textSize(70);
     text("HA HA HA easy win",200,height/2);
     text("(press 'v' to restart)",200,height/2+100);
     noLoop();
   }
}
}













class Monster
{
  PVector pos;
  boolean change;
  int mov;
  int max;
  int peaker;
 Monster()
 {
  pos = new PVector(width/2,height/2);
  change = false;
  max = 80;
  mov =99;
  peaker=30;
 }
 
 void drawme()
 {
 
   if(mov == 0 && pos.y>max)
   {
   monster.pos.y -= 5;
   }
   else if(mov == 1 && pos.y<height-80 && dist(width-34,height-20,pos.x-75,pos.y-75) > max+150)
   {
     monster.pos.y += 5;
   }
    else if(mov == 2 && pos.x<width-80 && dist(width-34,height-20,pos.x-75,pos.y-75) > max+150)
   {
     monster.pos.x += 5;
   }
    else if(mov == 3 && pos.x>80)
   {
     monster.pos.x -= 5;
   }

   // face
   stroke(#50C418);
   fill(#50C418);
   rect(pos.x-75,pos.y-75,150,150,900);
   if(change == false)
   {
   // eye
   fill(255);
   circle(pos.x+28,pos.y-30,50); 
   circle(pos.x-28,pos.y-30,50); 
   fill(0);
   stroke(0);
   circle(pos.x+28,pos.y-30,30);
   circle(pos.x-28,pos.y-30,30);
   fill(255);
   //fill(#F5071B);
   circle(pos.x+28,pos.y-30,10);
   circle(pos.x-28,pos.y-30,10);
   // smile
   stroke(0);
   ellipse(pos.x,pos.y+30,70,20);
   fill(#50C418);
   stroke(#50C418);
   ellipse(pos.x,pos.y+29,70,20);
   // teeth
   fill(255);
   stroke(255);
   triangle(pos.x-30,pos.y+34,pos.x-15,pos.y+38,pos.x-20,pos.y+20);
   triangle(pos.x+10,pos.y+39,pos.x+25,pos.y+36,pos.x+15,pos.y+21);
   }
   if(change == true)
   {
    // fence
   stroke(255);
   fill(random(0,255),random(0,255),random(0,255));
   rect(width-160,height-145,200,200,200);
   // wierd eye
   if(peaker<=150)
   {
    peaker+=1; 
   }
   stroke(#50C418); 
   strokeWeight(20);
   line(pos.x+30,pos.y-65,pos.x+30,pos.y-peaker);
   line(pos.x-30,pos.y-65,pos.x-30,pos.y-peaker);
   // eye teleport
   strokeWeight(1);
   stroke(0);
      fill(255);
   circle(pos.x+30,pos.y-peaker,50); 
   circle(pos.x-30,pos.y-peaker,50); 
   fill(0);
   stroke(0);
   circle(pos.x+30,pos.y-peaker,30);
   circle(pos.x-30,pos.y-peaker,30);
   line(pos.x+15,pos.y-30,pos.x+40,pos.y-30);
   line(pos.x-15,pos.y-30,pos.x-40,pos.y-30);
   fill(#F5071B);
   circle(pos.x+30,pos.y-peaker,10);
   circle(pos.x-30,pos.y-peaker,10);
   
   // smile teleport
   stroke(0);
   fill(0);
   ellipse(pos.x,pos.y+30,70,20);
   // teeth teleport
    fill(#F5071B);
    stroke(#F5071B);
   triangle(pos.x-27,pos.y+23,pos.x-12,pos.y+20,pos.x-17,pos.y+65);
   triangle(pos.x+10,pos.y+20,pos.x+25,pos.y+23,pos.x+15,pos.y+65);


 }
 }
}


class followers  
{
 PVector loc;
 float speed;
 boolean alive;
 boolean level2;
 boolean level3;
 boolean drunk;
  followers(PVector location)
  {
   loc = location; 
   alive =true;
   level2 =false;
   level3 =false;
   drunk =false;
  }
  
  void drawme()
  {
  
   stroke(0);
   
   if(monster.change == false && alive == true)
   {
   fill(#50C418);
   if(drunk == true)
   {
   fill(#F5071B);
   }
   line(loc.x-3,loc.y+2,loc.x+3,loc.y+2);
   }
   else if(level2 == true)
   {
    fill(random(0,255),random(0,255),random(0,255));
    circle(loc.x-7,loc.y-9,10);
    circle(loc.x+7,loc.y-9,10);
    fill(0);
   }
    else if(level3 == true)
    {
      fill(#FEFF2E);
    }
    
    else if(drunk == true)
    {
      fill(#F5071B);
    }
   else
   {
    fill(0); 
   }
   // speck
   ellipse(loc.x,loc.y,20,20);
   fill(255);
   ellipse(loc.x-4,loc.y-3,7,7);
   ellipse(loc.x+4,loc.y-3,7,7);
   fill(255);
   // counter
   textSize(20);
   text("Alive:"+(speck.length-dead),5,40);
   if(index == 1 || index == 2)
   {
   text("reamaining teleport(t):"+(index-happened),width-300,40);
   text("reamaining drunk power(o):"+(index+1-just2),width-300,70);
   }
   text("Died:"+dead,5,850);
   fill(255);
   if(alive == false)
   {
   fill(255);
   stroke(255);
   }
   ellipse(loc.x-4,loc.y-3,3,3);
   ellipse(loc.x+4,loc.y-3,3,3);
    if(monster.change == false && alive == true)
   {
   line(loc.x-3,loc.y+2,loc.x+3,loc.y+2);
   }
   else
   {
     fill(255);
     ellipse(loc.x,loc.y+4,5,7);
   }
  }
  
  void update()
  {
    
    if(monster.change == false && alive == true || (alive == true && drunk == true))
    {
      
    if(dist(loc.x,loc.y,monster.pos.x,monster.pos.y) >= 80)
   {
     speed = 0.02;
     if(drunk == true)
     {
      speed = 0.009; 
     }
   float x = monster.pos.x - loc.x;
   loc.x += x * speed;
   float y = monster.pos.y - loc.y;
   loc.y += y * speed;  
   }
   else if (dist(loc.x,loc.y,monster.pos.x,monster.pos.y) < 77 && drunk == false)
   {
     speed = 0.05;
   float x = monster.pos.x - loc.x;
   loc.x -= x * speed;
   float y = monster.pos.y - loc.y;
   loc.y -= y * speed;      
   }
   
   // for the drunk
   if(dist(loc.x,loc.y,monster.pos.x,monster.pos.y+30)<20 && alive == true && drunk == true && monster.change == true )
    {
      loc.x=spacing;
      loc.y=880;
      alive = false;
      dead++;
      spacing+=20;
    }
  }
  
  else if (monster.change == true)
  {
     if(dist(loc.x,loc.y,monster.pos.x,monster.pos.y+30)<20 && alive == true)
    {
      loc.x=spacing;
      loc.y=880;
      alive = false;
      dead++;
      spacing+=20;
    }
    
    
   if(alive==true)
    {
    if(loc.x<width-10 && loc.x>10)
    {
      if (level3 == true)
     {
       speed = 0.07;
     }
   float x = (width-34) - loc.x;
   loc.x += x * speed;
    }
    if(loc.y<height-10 && loc.y>10)
    {
      if (level3 == true)
     {
       speed = 0.07;
     }
   float y = (height-20) - loc.y;
   loc.y += y * speed;  
    }
   }
   
  }
}
}





void mouseClicked() 
{
  if(start == true)
  {
  if(monster.max == 180)
  {
  monster.change = false;
  monster.peaker = 30;
  monster.max = 80;
  }
  else if(monster.max == 80)
  {
  monster.change = true;
  monster.max = 180;
  for(int i = 0; i<speck.length; i++)
  {
    speck[i].speed = random(1,6);
    speck[i].speed =  speck[i].speed/500;
  }
  }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      monster.mov = 0;
    } else if (keyCode == DOWN) {
      monster.mov = 1;
    } 
    else if (keyCode == RIGHT && monster.pos.x<width-80) {
      monster.mov = 2;
    } 
    else if (keyCode == LEFT) {
      monster.mov = 3;
    }
  }
    else if (key == 'x' && monster.change == true &&  speck[savei].alive == true && dist(width-70,height-60,speck[savei].loc.x,speck[savei].loc.y)>100 )
    {
      stroke(#F5071B);
      strokeWeight(5); 
      line(monster.pos.x+30,monster.pos.y-monster.peaker,speck[savei].loc.x,speck[savei].loc.y);
      line(monster.pos.x-30,monster.pos.y-monster.peaker,speck[savei].loc.x,speck[savei].loc.y);
     
      speck[savei].alive = false;
      speck[savei].loc.x = spacing;
      speck[savei].loc.y = 880;
      spacing+=20;
      dead++;
    }
    else if(key == 'v')
    {
      restart();
    }
    else if (key == 'd' && index<2 && start == false) {
     index++;
     
    } else if (key == 'a' && index>0 &&  start == false) {
      index--;
    }
    else if (keyCode == ENTER)
    {
      start = true;
    }
    else if (key == 't' && happened < index && (index==1 || index == 2)&& monster.change == true &&  speck[savei].alive == true && dist(width-70,height-60,speck[savei].loc.x,speck[savei].loc.y)>120) {
      
      monster.pos.x = speck[savei].loc.x;
      monster.pos.y = speck[savei].loc.y;
      happened =1;
    }
    else if (key == 'o' && just2<index+1 && monster.change == true &&  speck[savei].alive == true && (index==1 || index == 2))
    {
      speck[savei].drunk = true;
      just2++;
    }
  
}



void keyReleased() {
monster.mov = 99;
}


void house()
{
   // house
   stroke(0);
   fill(#D1A754);
   square(width-55,height-53,50);
   fill(#8B1E27);
   triangle(width-55,height-53,width-5,height-53,width-30,height-80);
   fill(#E0C691);
   if(monster.change == true)
   {
     textSize(30);
     fill(255);
    text("come in fast!", width-250,height-160);
    fill(255); 
   }
   rect(width-40,height-35,20,30);
   fill(0);
   stroke(#E0C691);
   if(monster.change == true)
   {
    fill(255);
    stroke(255);
   }
   circle(width-34,height-20,6);
   stroke(0);
   // winner
 
}

void Nearest()
{
  if(monster.change == true)
  {
   for(int i =0; i<speck.length; i++)
   {
     if(speck[i].alive == true )
   {
     Dist[i] = dist(monster.pos.x,monster.pos.y,speck[i].loc.x,speck[i].loc.y);  
   }
   else
   {
    Dist[i] = 9999; 
   }
   }
  float a = 1000;
    for(int i = 0; i<speck.length; i++)
  {
    if(index == 0)
    {
    if(a>Dist[i])
    {
     a=Dist[i];
     fill(255);
     savei = i;
    }
    }
    else if(index == 1 || index ==2)
    {
      speck[index].level2 = true;
      speck[index+1].level2 = true;
      if(index == 2)
      {
        speck[index+2].level2 = true;
        speck[index+3].level2 = true;
        speck[index+4].level3 = true;
        speck[index+5].level3 = true;
        if(a>Dist[i] && index != i && index+1 != i && index+2 != i && index+3 != i )
    {
     a=Dist[i];
     fill(255);
     savei = i;
    }
      }
      else if(a>Dist[i] && index != i && index+1 != i )
    {
     a=Dist[i];
     fill(255);
     savei = i;
    }
   
    }
  }
  
   if(speck[savei].alive == true && dist(width-70,height-60,speck[savei].loc.x,speck[savei].loc.y)>90)
   {
   fill(0);
   stroke(#BF150F);
   strokeWeight(1);
   circle(speck[savei].loc.x,speck[savei].loc.y,30);
   stroke(0);
   }
}

}


void restart()
{
 loop();
 onetime =0;
 happened =0;
 just2 = 0;
 index =0;
 monster = new Monster(); 
 dead = 0; 
 spacing =10;
 start = false;
}


void choice(int index)
{
  textSize(40);
  fill(#B91111);
  text("Choose your mode ;)",300,200);
  fill(0);
  stroke(255);
  rect(x[index],250,180,70); 
   if(index<3 && index>-1)
   {
   for(int i = 0; i<3; i++)
  {
    textSize(50);
    fill(#B91111);
    text(mode[i],x[i],300);
    }
    
  }
 
}

void initiallize()
{
 if(index == 1)
 {
 speck = new followers[15];
 }
 else if(index == 2)
 {
 speck = new followers[20];
 }
 else
 {
 speck = new followers[10];
 }
  Dist = new float[speck.length];
  for(int i =0; i<speck.length; i++)
  {
    speck[i] = new followers(new PVector(random(10,width-10),random(10,height-10)));
  }
  onetime = 1;
}
