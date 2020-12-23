//modulo battrack
module battrack(){
       difference(){
            translate([-30,0,0])
            cube([60, 42.5, 20]);
                translate([-11,0,0])
                    cube([22,40,20]);
                translate([15,0,4])
                    cube([15,42.5,16]);
                translate([-30,0,4])
                    cube([15,42.5,16]);
                translate([-30,12.5,0])
                    cube([15,42.5,5]);
                translate([15,12.5,0])
                    cube([15,42.5,5]);
        }
}