//modulo servobrace
radio = 1;
altura = 2.5;
lados = 30;
module servobrace(){
    
    difference(){
    translate([0,0,10])
        cube([30,2.5, 20], center=true);
    translate([0,0,10])
        rotate([90,0,0])
            cylinder(h=altura, r=radio, $fn = lados, center=true);
}

difference(){//izq
    translate([-32,0,10])
        cube([10,2.5, 20], center=true);
    translate([-32,0,10])
        rotate([90,0,0])
            cylinder(h=altura, r=radio, $fn = lados, center=true);
}

difference(){//der
    translate([32,0,10])
        cube([10,2.5, 20], center=true);
    translate([32,0,10])
        rotate([90,0,0])
            cylinder(h=altura, r=radio, $fn = lados, center=true);
}

    translate([-28,8.75,10])
        cube([2,20,20], center=true);
    translate([-15,8.75,10])
        cube([2,20,20], center=true);
    translate([15,8.75,10])
        cube([2,20,20], center=true);
    translate([28,8.75,10])
        cube([2,20,20], center=true);

    translate([-29,18,0])
        cube([15,2,20]);
    translate([14,18,0])
        cube([15,2,20]);
    
}


         
    