#define wait delay_ms
#define  d portd
int i,j,k;
void main() {
   trisb=0;
   trisc=0;
   trisd=0;
   trisc.b5=1;   // manual
   trisc.b6=1;           // street switch
   portb=0;
   portc=0;
   portd=0;
  // while(portc.b5);
   while(1){
     for(k=15;k>=0;k--){
     for(i=0;i<50;i++){
     
     while(portc.b5){            // c5 Auto/manual
     portb=0;
     d=0;
     if(portc.b6){                // c6 street switch
                  // west is on
       d.b0=1;
       d.b4=1;
       wait(3000);
       d.b4=0;
       d.b5=1;
       while(portc.b6&&portc.b5);

        }
       else{
                 // south is on
       d.b3=1;
       d.b1=1;
       wait(3000);
       d.b1=0;
       d.b2=1;
       while(!(portc.b6)&&portc.b5);
     }
     }
                 // Automatic mode phase 1
     d=0;
     d.b3=1;       // west Red led is on
     d.b2=1;        // south green is on
     if(k<4){d=0; d.b3=1; d.b1=1; d.b2=0; }

     portc=0;             // Display method on 7_Segment
    portc.b1=1;
    portc.b3=1;
    portb=k%10;
    wait(10);
    portc=0;
    portc.b0=1;
    portc.b2=1;
    portb=k/10;
    wait(10);
     }
     }
     d.b3=0;
     d.b1=0;
    for(k=23;k>=0;k--){
     for(i=0;i<50;i++){
     
     while(portc.b5){
     portb=0;
     d=0;
     if(portc.b6){
                  // west is on
       d.b0=1;
       d.b4=1;
       wait(3000);
       d.b4=0;
       d.b5=1;
       while(portc.b6&&portc.b5);

        }
       else{
                 // south is on
       d.b3=1;
       d.b1=1;
       wait(3000);
       d.b1=0;
       d.b2=1;
       while(!(portc.b6)&&portc.b5);
     }
     }
//     while(portc.b5);
                                 //Automatic mode phase 2
     d=0;
     d.b0=1;            // SOUTH RED is on
     d.b5=1;   
             // west green is on
     if(k<4){d.b4=1; d.b5=0; }

     portc=0;      // Display on 7_Segment
    portc.b1=1;
    portc.b3=1;
    portb=k%10;
    wait(10);
    portc=0;
    portc.b0=1;
    portc.b2=1;
    portb=k/10;
    wait(10);
     }
    }
     d.b0=0;
     d.b4=0;

   }
}