class TetrisBlocks
{
    TetrisBlocks(PVector position, int size, int leftwall, int rightwall, int bottom)
  {
    this.size = size;
    this.position = position;
    float r = random(50);
    this.blockcolor = color(r);
    this.rightwall = rightwall;
    this.leftwall = leftwall;
    this.bottom = bottom;
  }
  
  boolean collide(PVector position)
{
 return PVector.dist(position, this.position) < this.size;
}
  
  void draw()
{
  fill(255, 255, 255);
  rect(position.x, position.y, size, size);
  
  if(bottom > this.position.y + this.size)
      position.y++;
  
      
}
PVector getPosition(){return this.position;}

void goRight()
{
  if(position.x > rightwall)
    position.x-=size;
}

void goLeft()
{
  if(position.x < leftwall)
      position.x+=size;
}
  
  
void goDown()
{
      position.y+=size;
}

boolean stopped()
{
    if(bottom <= this.position.y + this.size){
      position.x = position.x;
      position.y = bottom - this.size;
      return true;
    } 
    else
      return false;
}
  PVector position;
  color blockcolor;
  int size;
  int leftwall;
  int rightwall;
  int bottom;
}