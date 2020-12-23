module conjunto(){
    
  
    difference(){
        union(){    
                difference(){ 
                     baseCilindro();
                }
                difference(){ 
                    covertura(r = 45, h = 20, both = false, center = false, $fn = 30);
                    translate([0,0,-35]){
                        cube([100,100,70], center = true); 
                    }
                }                   
        }
         translate([0,0,-15]){
         covertura(r=45, h=30, both=false, center=false, $fn=30);
        
    }
        
    
}
}


conjunto();



module baseCilindro(){
       
    difference(){
                
        cylinder(h=1.3, r = 47, center = true, $fn=50); //cilindro principal
                translate([-28, 32, 0]) //posicion
                agujeroCilindro(); //creo el agujero
                translate([32, -28, 0])
                agujeroCilindro();
                translate([32, 28, 0])
                agujeroCilindro();
                translate([-32, -28, 0])
                agujeroCilindro();
        }
               
}

module covertura(r = 4, h = 20, center = false, both = false, $fn = 30)
{
    hc = (both == true) ? h - 2 * r : h - r;
    posc = (center == true) ? 0 : h/2;  
      
    translate([0, 0, posc]) 
    translate([0, 0, -h/2]) {
        cylinder(r = 45, h = hc, $fn = 30);
        translate([0, 0, hc]) 
        sphere(r = 45, $fn = 30);
     }
}

module agujeroCilindro(){
    cylinder(h=1.5, r = 2, center = true);
}

