h = 25;
d = 6;
fn = 50;

cabinaMotor();

module cabinaMotor(){
    
   difference(){
    //pieza central
    rotate([0,90,0])
      translate([-20,10,20])
        cube ([40,20,40], center = true);
       
     // Agujeros principales
    translate([10,10,10])
      rotate([90,0,0])
        cylinder (h = h, d = d, center = true,$fn=fn);
       
    translate([30,10,30])
      rotate([90,0,0])
        cylinder (h = h, d = d, center = true,$fn=fn);

    translate([30,10,10])
      rotate([90,0,0])
        cylinder (h = h, d = d, center = true,$fn=fn);

    translate([10,10,30])
      rotate([90,0,0])
        cylinder (h = h, d = d, center = true,$fn=fn);
        
    // Agujero pequeño centro cubo
    translate([20,10,5])    
      cylinder (h = h, d = 2, center = true,$fn=fn);
 
    // Corte ancho derecha
    rotate([90,0,0])
      translate([36.5,30,-10])
        cube ([3.5,70,7], center = true); 
 
    // Corte ancho izquierda
    rotate([90,0,0])
      translate([3,30,-10])
        cube ([3.5,70,7], center = true); 
      
    // Corte estrecho derecha
    rotate([90,0,0])
      translate([39,30,-10])
        cube ([5,70,4], center = true); 
    
    // Corte estrecho izquierda
    rotate([90,0,0])
      translate([1,30,-10])
        cube ([5,70,4], center = true); 

    // Corte central
    rotate([90,0,0])
      translate([20,40,-10])
        cube ([11,70,13], center = true);  
  
    //corte lateral derecho
    rotate([90,0,40])
        translate([47.6,20,18])
            cylinder(r=25, h=3 ,$fn=3);
            
    rotate([90,0,320])
        translate([34.8,20,-37])
            cylinder(r=25, h=3 ,$fn=3);
            
    //corte lateral izquierdo
    rotate([90,0,220])
        translate([4.2,20,8])
            cylinder(r=25, h=3 ,$fn=3);
            
    rotate([90,0,140])
        translate([17.2,20,5])
            cylinder(r=25, h=3 ,$fn=3);
      
  }
  
  
  
 
  
   
  
    
  
  
  
    
  
}