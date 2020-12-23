//modulo hip
lados = 20;
h10 = 10;
d3 = 3;
d1_5 = 1.5;

module hip(){
    difference(){
    minkowski(){
        cube([80,40,3], center = true);
        cylinder(d=9,h=1,$fn =20);
    }
    cylinder(d=d3,h=5,$fn =lados, center = true);
    translate([-35,0,0])
        cylinder(d=d3,h=h10,$fn =lados, center = true);
    translate([35,0,0])
        cylinder(d=d3,h=h10,$fn =lados, center = true);
    translate([-22,12,0])
        cylinder(d=1.5,h=h10,$fn =lados, center = true);
    translate([-22,-12,0])
        cylinder(d=d1_5,h=h10,$fn =lados, center = true);
    translate([22,12,0])
        cylinder(d=d1_5,h=h10,$fn =lados, center = true);
    translate([22,-12,0])
        cylinder(d=d1_5,h=h10,$fn =lados, center = true);
     translate([-22,0,0])
        cube([12.5,20,5], center = true);
     translate([22,0,0])
        cube([12.5,20,5], center = true);
}

}



    