#line 1 "C:/Users/ayman/Desktop/Final Project Embedded  _Traffic Light/Code/COPY_finaL.c"


int i,j,k;
void main() {
 trisb=0;
 trisc=0;
 trisd=0;
 trisc.b5=1;
 trisc.b6=1;
 portb=0;
 portc=0;
 portd=0;

 while(1){
 for(k=15;k>=0;k--){
 for(i=0;i<50;i++){

 while(portc.b5){
 portb=0;
  portd =0;
 if(portc.b6){

  portd .b0=1;
  portd .b4=1;
  delay_ms (3000);
  portd .b4=0;
  portd .b5=1;
 while(portc.b6&&portc.b5);

 }
 else{

  portd .b3=1;
  portd .b1=1;
  delay_ms (3000);
  portd .b1=0;
  portd .b2=1;
 while(!(portc.b6)&&portc.b5);
 }
 }

  portd =0;
  portd .b3=1;
  portd .b2=1;
 if(k<4){ portd =0;  portd .b3=1;  portd .b1=1;  portd .b2=0; }

 portc=0;
 portc.b1=1;
 portc.b3=1;
 portb=k%10;
  delay_ms (10);
 portc=0;
 portc.b0=1;
 portc.b2=1;
 portb=k/10;
  delay_ms (10);
 }
 }
  portd .b3=0;
  portd .b1=0;
 for(k=23;k>=0;k--){
 for(i=0;i<50;i++){

 while(portc.b5){
 portb=0;
  portd =0;
 if(portc.b6){

  portd .b0=1;
  portd .b4=1;
  delay_ms (3000);
  portd .b4=0;
  portd .b5=1;
 while(portc.b6&&portc.b5);

 }
 else{

  portd .b3=1;
  portd .b1=1;
  delay_ms (3000);
  portd .b1=0;
  portd .b2=1;
 while(!(portc.b6)&&portc.b5);
 }
 }


  portd =0;
  portd .b0=1;
  portd .b5=1;

 if(k<4){ portd .b4=1;  portd .b5=0; }

 portc=0;
 portc.b1=1;
 portc.b3=1;
 portb=k%10;
  delay_ms (10);
 portc=0;
 portc.b0=1;
 portc.b2=1;
 portb=k/10;
  delay_ms (10);
 }
 }
  portd .b0=0;
  portd .b4=0;

 }
}
