//Pieza hecha por Luis Carlos Hurlé
use <BattRack.scad>
use <Foot-Left.scad>
use <Foot-Right.scad>
use <Hip.scad>
use <LegPart-V3.scad>
use <PhoneHolder.scad>
use <ServoBrace.scad>



translate([40,0,0])
  footleft();

translate([-30,0,0])
  footright();
  
translate([30,20,5])
  rotate([90,0,90])
    legpartv3();

translate([-40,20,5])
  rotate([90,0,90])
    legpartv3();

translate([0,0,40])
  hip();
 
translate([0,0,40])
  phoneholder();

translate([0,18,48])
  battrack();

translate([0,30,54])
  rotate([90,0,0])
    servobrace();