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
  if(PVector.dist(position, this.position) < 200 && PVector.dist(position, this.position) > 190)
  {
    movebullet = PVector.angleBetween(position, this.position);
    shoot();
  }
}

void shoot()
{
  bullet.add(new PVector(this.position.x, this.position.y, 0));
}

void draw(PVector tetrisblock)
{
  //-- fill in the ai rectangle.
   fill(0, 255, 0);
   rect(position.x,position.y, size, size + 10);
   
   //-- ai move down
   position.y+=move;
  
  if(position.y > bottom || position.y < top)
    move = move * -1;
    
    //--bullets shoot is near the player.
    for(int i = 0; i < bullet.size();i++)
    {
        fill(255,0,0);
        //rect(bullet.get(i).x,bullet.get(i).y, 5, 5);
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
PVector position;
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