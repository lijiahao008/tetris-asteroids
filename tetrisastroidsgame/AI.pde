class AI
{
  AI(PVector position, int size, int bottom, int top, boolean start, boolean direction, int rightwall, int leftwall)
{
  this.position = position;
  this.size = size;
  this.top = top + size;
  this.bottom = bottom - (size * 2);
  this.start = start;
  this.bullet = new ArrayList<PVector>();
  this.direction = direction;
  this.rightwall = rightwall;
  this.leftwall = leftwall;
  float r = random(2);
  aicolor = new Color((int)r);
  //-- moves the target in a certain direction
  if(start)
    move = 2;
  else
    move = -2;
}

void getActiveTarget(PVector position)
{
  //-- println(PVector.dist(position, this.position));
  //-- distance away to shoot the player
  for(int i = 0; i < 3; i++)
  {
  if(PVector.dist(position, this.position) < 200 && PVector.dist(position, this.position) > 190)
  {
    movebullet = PVector.angleBetween(position, this.position);
    shoot();
  }
  }
}

//-- used to shoot a bullet by creating the bullet.
void shoot()
{
  bullet.add(new PVector(this.position.x, this.position.y, 0));
}

//-- get the position of the ai.
PVector getPosition(){return this.position;}

//-- determine which color to use based on the players color
//-- and possibly the last color the player had to make sure
//-- the player cannot get a match.
void makeDecision()
{
  if(aicolor.getR() < r1)
    aicolor.setR(100.0);
    else
    aicolor.setR(100.0);
    
  if(aicolor.getG() < g1)
    aicolor.setR(100.0);
  else
    aicolor.setR(100.0);
    
  if(aicolor.getB() < b1)
    aicolor.setR(100.0);
    else
    aicolor.setR(100.0);

}

ArrayList<PVector> getBullet(){return bullet;}

//-- get the color from this class.
//-- used to make sure the tetis block
//-- and turn to this color.
float colorR(){return aicolor.getR();}
float colorG(){return aicolor.getG();}
float colorB(){return aicolor.getB();}

//-- set the color of the ai.
void setColor(float r1, float g1, float b1)
{ 
this.r1 = r1;
this.g1 = g1;
this.b1 = b1;
}

//-- draws the ai onto the screen.
void draw(PVector tetrisblock)
{
  //-- fill in the ai rectangle.
   fill(0, 255, 0);
   rect(position.x,position.y, size, size + 10);
   
   //-- ai move down
   position.y+=move;
  
  //-- if the ai reaches the end of the screen it will trun
  //-- to the other direction.
  if(position.y > bottom || position.y < top)
    move = move * -1;
    
    //--handles the bullets. loops through and tells the bullets where to shoot
    //-- and this also destroys the bullet.
    for(int i = 0; i < bullet.size();i++)
    {
      //-- visual representation of the bullet.
        fill(aicolor.getR(), aicolor.getG(), aicolor.getB());
        ellipse(bullet.get(i).x,bullet.get(i).y, 10,10);
        
        //-- bullets shoot in the right direction
        if(direction)
        {
                bullet.get(i).y+=-movebullet*2;
                bullet.get(i).x++;
        }
        else
        {
                bullet.get(i).y-=-movebullet*2;
                bullet.get(i).x--;
        }
        
        //-- bullets are destroyed if it hits a wall.
        if(bullet.get(i).x < rightwall || bullet.get(i).x > leftwall || tetrisblock.dist(bullet.get(i)) < 10)
          bullet.remove(i);
    }
}

//-- variables
Color aicolor;
PVector position;
float r1, g1, b1;
ArrayList<PVector> bullet;
boolean start;
int size;
int move;
int rightwall;
int leftwall;
float movebullet;
int bottom;
int top;
boolean direction;
}