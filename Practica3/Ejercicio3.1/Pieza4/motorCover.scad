//modulo motorcover

nlados = 100;
h = 20;
r = 2;

module motorcover(){
    
cube(size = [40,20,5], center = true);

difference(){
    translate([17.0,12.9,0])
    cube(size = [6,6,5], center = true);
    translate([17.0,12.9,-4])
    cylinder(r=r,h=h,$fn=nlados);
}

translate([-34,-25.4,0])
difference(){
    translate([17.0,12.9,0])
    cube(size = [6,6,5], center = true);
    translate([17.0,12.9,-4])
    cylinder(r=r,h=h,$fn=nlados);
}
    
}


