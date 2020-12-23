//modulo footleft
module footleft(){
    minkowski(){
        translate([-25,-25,-2.5])
        cube([50,50,5]);
        cylinder(d=9,h=1,$fn =30);
    }

    translate([-24,2,9.5])
        cube(size = [5, 5, 14], center = true);

    translate([9,4,9])
        cube(size = [5, 10, 14], center = true);
}