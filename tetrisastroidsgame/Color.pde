class Color
{
  Color(int random)
  {
    switch(random)
    {
      case 0:
      r = 255;
      g = 0;
      b = 0;
      break;
            case 1:
      r = 0;
      g = 255;
      b = 0;
      break;
            case 2:
      r = 0;
      g = 0;
      b = 255;
      break;

    }
  }
  
  float getR(){return r;}
  float getB(){return b;}
  float getG(){return g;}
  
  void setG(float g){this.g = g;}
  void setR(float r){this.r = r;}
  void setB(float b){this.b = b;}
  
  float r, g, b;
}