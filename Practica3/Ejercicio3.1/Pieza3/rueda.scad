fn = 40;
h = 15;
d = 4;

rueda();

module rueda(){
  translate([0,0,2])
  cuerpoPrincipal();
  tuercaCentral();
}


module cuerpoPrincipal(){
  
    difference(){
      // Cilindro original
      translate([0,0,0])
        cylinder (h = 10, d = 35, center = true,$fn=20);

      // Agujeros 
      translate([0,0,0])
        cylinder (h = h, d = d, center = true,$fn=fn);
 
      translate([9,0,0])
        cylinder (h = h, d = d, center = true,$fn=fn);
 
      translate([0,9,0])
        cylinder (h = h, d = d, center = true,$fn=fn);

      translate([0,-9,0])
        cylinder (h = h, d = d, center = true,$fn=fn);
 
      translate([-6,-6,0])
        cylinder (h = h, d = d, center = true,$fn=fn);
 
      translate([-6,6,0])
        cylinder (h = h, d = d, center = true,$fn=fn);
 
      translate([6,-6,0])
        cylinder (h = h, d = d, center = true,$fn=fn);
 
      translate([6,6,0])
        cylinder (h = h, d = d, center = true,$fn=fn);
 
      translate([-9,0,0])
        cylinder (h = h, d = d, center = true,$fn=fn);
        
       //Hueco superior
      translate([0,0,5])
       cylinder (h = 4, d = 30, center = true,$fn=fn);
 
      // hueco inferior
      translate([0,0,-5])
        cylinder (h = 4, d = 30, center = true,$fn=fn);
    }
}

module tuercaCentral(){
    
    difference(){
    translate([0,0,2.5])
      cylinder (h = 9, d = 10, center = true,$fn=fn);
      
    translate([0,0,2.5])
      cylinder (h = h, d = d, center = true,$fn=fn); //agujero central
  }
}


