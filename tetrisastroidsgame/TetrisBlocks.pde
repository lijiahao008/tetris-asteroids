class TetrisBlocks
{
    TetrisBlocks(PVector position, int size)
  {
    this.size = size;
    this.position = position;
    float r = random(50);
    this.blockcolor = color(r);
  }
  
  void draw()
{
  rect(position.x, position.y, size, size);
  position.y++;
}
PVector getPosition(){return position;}

void goRight(){position.x-=size;}

void goLeft(){position.x+=size;}
  
  PVector position;
  color blockcolor;
  int size;
}