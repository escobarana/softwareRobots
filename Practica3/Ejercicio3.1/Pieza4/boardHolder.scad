nlados = 200;
h10 = 10;
r2 = 2;

module boardholder(){
    difference(){
    rotate([90,0,0])
    cube([120, 110, 1],center=true); 
    translate([-25,3,0])
    rotate([90,0,0])
    cube([20, 40, 20],center=true);
    translate([-20,3,-35])
    rotate([90,0,0])
    cube([8, 15, 20],center=true);
    translate([-13,3,34])
    rotate([90,0,0])
    cube([13, 15, 20],center=true);
    translate([12,3,22])
    rotate([90,0,0])
    cube([33, 46, 20],center=true);
    translate([37,3,-16])
    rotate([90,0,0])
    cube([4, 10, 20],center=true);
    translate([35,3,19])
    rotate([90,0,0])
    cube([8, 40, 20],center=true);
    translate([13,3,-32])
    rotate([90,0,0])
    cube([52, 15, 20],center=true);
   
   
    translate([4,3,-7])
    rotate([90,0,0])
    cylinder(h=h10, r=r2,$fn=nlados);
    translate([-9,3,-18])
    rotate([90,0,0])
    cylinder(h=h10, r=r2,$fn=nlados);
    translate([20,3,-18])
    rotate([90,0,0])
    cylinder(h=h10, r=r2,$fn=nlados);
    translate([30,3,-7])
    rotate([90,0,0])
    cylinder(h=h10, r=r2,$fn=nlados);
    translate([-35,3,40])
    rotate([90,0,0])
    cylinder(h=h10, r=r2,$fn=nlados);
    translate([-35,3,28])
    rotate([90,0,0])
    cylinder(h=h10, r=r2,$fn=nlados);
    //Izquierda
    translate([-45,3,15])
    rotate([90,0,0])
    cylinder(h=h10, r=r2,$fn=nlados);
    translate([-45,3,-17])
    rotate([90,0,0])
    cylinder(h=h10, r=r2,$fn=nlados);
    translate([-35,3,-40])
    rotate([90,0,0])
    cylinder(h=h10, r=r2,$fn=nlados);
    translate([-35,3,-28])
    rotate([90,0,0])
    cylinder(h=h10, r=r2,$fn=nlados);
    //Superiores
    translate([-12,3,-45])
    rotate([90,0,0])
    cylinder(h=h10, r=r2,$fn=nlados);
    translate([20,3,-45])
    rotate([90,0,0])
    cylinder(h=h10, r=r2,$fn=nlados);
    translate([30,3,-45])
    rotate([90,0,0])
    cylinder(h=h10, r=1.5,$fn=nlados);
    translate([39,3,-45])
    rotate([90,0,0])
    cylinder(h=h10, r=1.5,$fn=nlados);
    //Inferiores
    translate([-9,3,44])
    rotate([90,0,0])
    cylinder(h=h10, r=r2,$fn=nlados);
    translate([35,3,44])
    rotate([90,0,0])
    cylinder(h=h10, r=r2,$fn=nlados);
    translate([45,3,-28])
    rotate([90,0,0])
    cylinder(h=h10, r=r2,$fn=nlados);
    translate([45,3,-17])
    rotate([90,0,0])
    cylinder(h=h10, r=r2,$fn=nlados);
    translate([45,3,-6])
    rotate([90,0,0])
    cylinder(h=h10, r=r2,$fn=nlados);
    translate([45,3,5])
    rotate([90,0,0])
    cylinder(h=h10, r=r2,$fn=nlados);
    translate([45,3,16])
    rotate([90,0,0])
    cylinder(h=h10, r=r2,$fn=nlados);
    translate([45,3,27])
    rotate([90,0,0])
    cylinder(h=h10, r=r2,$fn=nlados);
    
}
difference(){
        translate([54.5,0,-61.5])
        
     rotate([90,0,0])
    cube([10,15,1],center=true); 
        translate([54.5,5,-61.5])
        rotate([90,0,0])
        cylinder(h=h10, r=r2,$fn=nlados);
}
difference(){
        translate([54.5,0,61.5])
     rotate([90,0,0])
    cube([10,15,1],center=true); 
        translate([54.5,5,61.5])
        rotate([90,0,0])
        cylinder(h=h10, r=r2,$fn=nlados);
}

}


