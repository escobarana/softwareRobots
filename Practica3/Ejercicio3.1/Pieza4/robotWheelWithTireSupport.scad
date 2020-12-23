nlados = 200;
h10 = 10;


module robotwheelwithtiresupport(){
    tuerca();
difference(){
    translate([0,0,30])
    rotate([90,0,0])
    cylinder(h=3, r=30, $fn=nlados, center=true);
    translate([0,0,15])
        rotate([90,0,0])
        cylinder(h=h10, r=9, $fn=nlados, center=true);
    translate([0,0,45])
        rotate([90,0,0])
        cylinder(h=h10, r=9, $fn=nlados, center=true);
    translate([-15,0,30])
        rotate([90,0,0])
        cylinder(h=h10, r=9, $fn=nlados, center=true);
    translate([15,0,30])
        rotate([90,0,0])
        cylinder(h=h10, r=9, $fn=nlados, center=true);
    translate([0,0,30])
        rotate([90,0,0])
        cylinder(h=h10, r=1, $fn=nlados, center=true);
}
}



module tuerca(){
    difference(){
    translate([0,1.5,30])
    rotate([90,0,0])
    cylinder(h=2, r=3, $fn=nlados, center=true);
        translate([0,0,30])
        rotate([90,0,0])
        cylinder(h=h10, r=1, $fn=nlados, center=true);
    }
    
}