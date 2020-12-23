use <ex3.2_base.scad>
use <ex3.2_box.scad>
use <ex3.2_connectionPiece.scad>

union(){
    //Base
    translate([60,0,0])
        rotate([0,0,90])
            base();
    
    //Connection of pieces
    rotate([180,0,90])
        translate([0,14,-70])
            connection();
    
    //Box
    translate([-33,0,85])
        rotate([0,0,-90])
            box();
}