/*
  timeTicker
  Chia Yang Chang (Andrew)
  10/2019
*/

/*
  Acknowledgments
  Inspired by:

  Coding Challenge #102: 2D Water Ripple
  https://www.youtube.com/watch?v=BZUdGqeOD0w&t=678s
  
*/
int w1=200;
int h1=200;
float sc,min,hr;
int x1,y1;
float r,g,b;
float[][] cur; 
float[][] pre; 
float damping=0.95;

void setup(){
  size(600,600);
  //pixelDensity(2);
  w1=width;
  h1=height;
  cur= new float[w1][h1];
  pre= new float[w1][h1];
  r=255;
  g=255;
  b=255;
  
}

void draw(){
  
 
  sc+=1;
  if(sc == 60)
  {
    sc=0;
    min+=1;
    cur[width/2][height/2]=255;  
    r=random(0,255);
    g=random(0,255);
    b=random(0,255);
  }
  if(min==15)
  {
   min=0;
   hr+=1;
   damping=0.9999; 
  }
  if(hr==2)
  {
   hr=0;
   min=0;
   damping=0.9; 
  
  }
 
  background(0);
  loadPixels();
  for(int i=1;i < w1-1;i++){
   for(int j=1;j< h1-1;j++){
     
     
   cur[i][j] = (pre[i-1][j]+
                pre[i+1][j]+
                pre[i][j+1]+
                pre[i][j-1])/2-
                cur[i][j];
                cur[i][j]=cur[i][j]*damping;
                int index=i+j*w1;
                pixels[index]=color(cur[i][j]*r,cur[i][j]*g,cur[i][j]*b);
   }
  }
  
  updatePixels();
  float[][] temp=pre;
  pre=cur;
  cur=temp;
  
}
