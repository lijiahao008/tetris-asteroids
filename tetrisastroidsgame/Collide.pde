class Collide
{
  Collide(){}
  
  boolean collide(PVector position1, PVector position2, int size){return position1.dist(position2) <= size;}
  
  
  
}