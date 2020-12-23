//modulo phoneholder

module phoneholder(){
    cube([75,15,1], center = true);//base
translate([36.5,-7.5,0])
    cube([1,15,40]);//der
translate([-37.5,-7.5,0])
    cube([1,15,40]);//izq
translate([-37.5,-7.5,0])
    cube([75,1,10]);//vertical bajo
translate([-37.5,7.5,0])
    cube([75,1,125]);//vertical alta
translate([-30,7.5,40])
    cube([5,15,30]);//trasera der visto desde atras
translate([25,7.5,40])
    cube([5,15,30]);//trasera izq visto desde atras
translate([-25,7.5,40])
    cube([50,3,30]);

  rotate([110,0,0])
    translate([0,35,-30])
      cube ([50,5,15], center = true); 

}

