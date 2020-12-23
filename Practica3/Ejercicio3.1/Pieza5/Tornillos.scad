module cilindro(){
    cylinder(h= 10*3, r=1 ,d = 4, center = true, $fn=15);
}



for (i = [1 : 2])
 {
     difference(){
        translate([-30+(i*20), -6 , 10])
        cilindro();
        translate([-30+(i*20), -6 , 10])
        cylinder(h= 10*5,r=1, d = 3, center = true, $fn=15);
     }
 }   

for (i = [1 : 2]){
    
    difference(){
         translate([-30+(i*20), 6, 10])
         cilindro();
         translate([-30+(i*20), 6 , 10])
         cylinder(h= 10*5, d =  3, center = true, $fn=15);        
     } 
}
     

 

