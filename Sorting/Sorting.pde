import java.util.*;

int n=30,i=0,j=1,time=150,min=0;
//n can be any number, but only numbers divisible from  the width will look okay
//for a width of 1260 1, 2, 3, 4, 5, 6, 7, 9, 10, 12, 14, 15, 18, 20, 21, 28, 30, 35, 36, 42, 45, 60, 63, 70, 84, 90, 105, 126, 140, 180, 210, 252, 315, 420, 630, or 1260 will work
//anything where the width of a bar is less than two pixels is very wierd
//modify time so that it's not too bad of a weight
boolean next=false;
ArrayList<Integer>arr=new ArrayList<Integer>(n);


void setup() {
  frameRate(60);
  //higher framerate will speed it up if delay is 0
  size(1920,1080);
  for(int i=1;i<=n;i++){
    arr.add(i);
  }
  Randomize();
  background(255);
  colour(0,0,0);
  delay(1000);
}

void draw() {
  //Only have 1 active at a time
   //insertionSort();
   selectionSort();
} 

//insertionSort
void insertionSort(){
  background(255);
  colour(0,0,0);
  if(i==0)
    i++;
    
  if(i==n){
    exit();
  }
  else if(j==0){
    compare(0,0);
    i++;
    j=i;
  }
  else{
    if(!compare(j-1,j)){
      swap(j-1,j);
      fillSquare(j,0,0,0);
      next=true;
      j--;
    } 
    else{
      fillSquare(j-1,0,0,0);
      i++;
      j=i;
    }
  }
  delay(time);
}

//selection sort
void selectionSort(){
  background(255);
  colour(0,0,0);
  if(i==n-1){
    exit();
  }
  else if(j==n){
      fillSquare(i,255,0,0);
      fillSquare(min,255,0,0);
    j++;
  }
  else if(j>n){
    delay(time);
    swap(i,min);
    i++;
    min=i;
    j=i+1;
  }
  else{
    if(!compare(min,j)){
      min=j;
    } 
    j++;
  }
  delay(time);
}

//default stuff they both use
 void colour(int r, int g, int b){
    for(int i=0;i<n;i++) //displays squares
      fillSquare(i,r,g,b);
 }
 void swap(int a,int b){
  int temp=arr.get(a);
  arr.set(a,arr.get(b));
  arr.set(b,temp);
  cover(a,b);
  fillSquare(a,255,0,0);
  fillSquare(b,255,0,0);
 }

 void cover(int a,int b){
  stroke(255);
  fill(255);
  rect(width/n *b,height,width/n,-1 *height);
  //use height and width so more values of n work
  rect(width/n *a,height,width/n,-1 *height);
  stroke(0);
 }
 void fillSquare(int b,int r,int g,int bl){
  fill(r,g,bl);
  rect(width/n *b,height,width/n,-1*arr.get(b) *height/n);
 }
 boolean compare(int a,int b){
  fill(0,255,0);
  fillSquare(a,0,255,0);
  fillSquare(b,0,255,0);
  return( (a>b&&arr.get(a)>=arr.get(b)) ||(a<b&&arr.get(a)<=arr.get(b)));
}

//Randomize
void Randomize(){
  Random r=new Random();
  for(int i=0;i<n*n;i++){
    int a=Math.abs(r.nextInt()%n),b=Math.abs(r.nextInt()%n),temp=arr.get(a);
    arr.set(a,arr.get(b));
    arr.set(b,temp);
  }
}
