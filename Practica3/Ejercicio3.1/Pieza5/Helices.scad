module primerCilindro(){
    translate([-70,-80,0])
        cylinder(h=1, r=50, center= true, $fn=200);
}
module segundoCilindro(){
        translate([-70,80,0]){
            cylinder(h=1, r=50, center= true, $fn=200);
        }
}
module agujerosGrandes(x,y,z){
    translate([x,y,z]){
        cylinder(r=2,h = 50, center=true, $fn=200);
    }
}

module agujerosPequenos(x,y,z){
    translate([x,y,z]){
        cylinder(r=1.5, h = 70, center=true, $fn=200);
    }
}

module cilindroUnoFinal(){
    difference(){
       
        primerCilindro();
        agujerosGrandes(-70,-40,0);
        agujerosGrandes(-30,-80,0);
        agujerosGrandes(-110,-80,0);
        agujerosGrandes(-70,-120,0);
        agujerosGrandes(-55,-80,0);
        agujerosGrandes(-85,-80,0);
        agujerosGrandes(-70,-95,0);
        agujerosGrandes(-70,-65,0);
        
     
    }
}

module cilindroDosFinal(){
    difference(){
          segundoCilindro();
            agujerosGrandes(-70, 120,0);
            agujerosGrandes(-70, 40,0);
            agujerosGrandes(-85,80,0);
            agujerosGrandes(-110,80,0);
            agujerosGrandes(-30, 80,0);
            agujerosGrandes(-55,80,0);
            agujerosGrandes(-70, 95,0);
            agujerosGrandes(-70, 65,0);
            agujerosPequenos(-70, 110,0);
            agujerosPequenos(-70, 50,0);
            agujerosPequenos(-100,80,0);
            agujerosPequenos(-40,80,0);
            agujerosPequenos(-90, 100,0);
            agujerosPequenos(-90, 60,0);
            agujerosPequenos(-50, 100,0);
            agujerosPequenos(-50, 60,0);
        }
}

module barraHelice(){
    difference(){
        translate([5,-90,0])
        cube([10,190,10]);
        translate([6,90,1])
        cube([8,195,8]);
        agujerosPequenos(10,90,0); 
        agujerosPequenos(10,60,0);
        translate([10,-78,0]){
        cylinder(r=3, h = 70, center=true, $fn= 200);
    } 
        
 }
}
module hexagono(){
    difference(){
    translate([10,-78,0])
    rotate([0,0,90])
    cylinder(r=15,h = 3, center=true, $fn=6);
    agujerosPequenos(19,-78,0); 
    translate([10,-78,0]){
        cylinder(r=3, h = 70, center=true, $fn= 200);
    }
    agujerosPequenos(1,-78,0); 
    }
    
    
}
module helice(){
    difference(){
        union(){
            union(){
                barraHelice();
                hexagono();
            }
            translate([10,-55,10])
            cylinder(r1=4,r=1,h=30,$fn= 50);
           
            
           
        }
        translate([10,-70,0])
        agujerosPequenos();
        translate([10,-85,0])
        agujerosPequenos();
    }
}

cilindroDosFinal();
cilindroUnoFinal();
helice();
