//Pieza creada por Luis Carlos Hurlé

use<robotWheelWithTireSupport.scad>
use<motorCover.scad>
use<boardHolder.scad>
use<baseSupport.scad>
use<base.scad>


translate([-65,0,-10])
rotate([0,0,90])
robotwheelwithtiresupport();
translate([60,0,-10])
rotate([0,0,90])
robotwheelwithtiresupport();
motorcover();
rotate([90,180,90])
translate([0,-30,0])
boardholder();
rotate([180,0,0])
translate([0,0,5])
basesupport();
base();