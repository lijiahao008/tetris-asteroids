class ObstacleBlock
{
    ObstacleBlock(PVector position, int size)
  {
    this.size = size;
    this.position = position;
  }
  
  void draw()
{
  fill(255, 0, 0);
  rect(position.x, position.y, size, size);
}

boolean collide(PVector position)
{
 return PVector.dist(position, this.position) < this.size;
}

PVector getPosition(){return this.position;}
  
  PVector position;
  int size;
}