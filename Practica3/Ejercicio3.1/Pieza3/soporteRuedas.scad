h = 100;
d= 5;
fn = 100;


soporteRueda();

module soporteRueda(){
  union(){
    rectangulo();
    soporteLateral();  
  }
}

module rectangulo(){
    
    difference(){

      rotate([90,0,0])
          cube ([20,3,39], center = true);
    
     translate([0,-10,0])
         cylinder (h = h, d = d, center = true, $fn = fn);
     
      // Agujero base derecha
      translate([0,10,0])
         cylinder (h = h, d = d, center = true, $fn = fn); 
    }
    
}

module soporteLateral(){
    
    difference(){
      // Soporte Central
      rotate([0,0,90])
        translate([0,8.5,10])
          cube ([39,3,20], center = true);

      // Agujero central
      translate([10,0,10])
        rotate([0,90,0])
          cylinder (h = h, d = d, center = true, $fn = fn);
   
      //Cortar izquierda   
      translate([-5.5,-20,10])
        rotate([60,0,0])
          rotate([90,0,0])
            cube([10,10,35], center = true);
        
      // Corte derecha
      translate([-5.5,20,10])
        rotate([30,0,0])
          cube([10,10,35], center = true);

    }
    
}
