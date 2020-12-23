// Variables declaration
baseY = 70;
baseX = 17;
baseZ = 2;

screwHeight = baseZ+3;
screwRadio = 3.2;

screwBorder = 3;

// Operations
module connection(){
    difference(){
        cube([baseX, baseY, baseZ], center = true);
        translate([0, -(baseY/2) + screwRadio + screwBorder, -1]){
            cylinder(r=screwRadio, h=screwHeight, $fn=200, center = true);
        }
        translate([0, (baseY/2) - screwRadio - screwBorder, -1]){
            cylinder(r=screwRadio, h=screwHeight, $fn=200, center = true);
        }
    }
 }
 connection();