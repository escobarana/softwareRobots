//modulo base

numlados = 50;
h30 = 30;
h40 = 40;
h28 = 28;
h15 = 15;

r2 = 2;
r5 = 5;
r10 = 10;

module base(){
    
  vertice = [
                  [60, 59, 0],
                  [60, 59, 30],
                  [60, -59, 30],
                  [60, -59, 0],
                  [-60, 59, 30],
                  [-60, 59, 0],
                  [-60, -59, 30],
                  [-60, -59, 0],
                  //parte delantera
                  [4, -70, 30],
                  [4, -70, 0],
                  [-4, -70, 30],
                  [-4, -70, 0]

    ];
verticeDos = [
                  [58, 58, 1],
                  [58, 58, 30],
                  [58, -58, 30],
                  [58, -58, 1],
                  [-58, 58, 30],
                  [-58, 58, 1],
                  [-58, -58, 30],
                  [-58, -58, 1],
                  //parte delantera
                  [4, -69, 30],
                  [4, -69, 0],
                  [-4, -69, 30],
                  [-4, -69, 0],

    ];


difference(){
        hull(){
          for (pos = vertice)
            translate(pos)
              cylinder(r = 10, center = true, $fn =numlados);
        }
        hull(){
          for (pos = verticeDos)
            translate(pos)
              cylinder(r = 8, center = true, $fn = numlados);
        }
        translate([60,-5,0])
        cube([5, 50, 10],center=true); 
        translate([-60,-5,0])
        cube([5, 50, 10],center=true); 
        rotate([180,0,0])
        translate([45,-58,-20])
        cube([15, 30, 10],center=true); 
        //Agujeros
        //Izquierda
        rotate([90,0,0])
        translate([-20, 15, 80])
        cylinder(r=r10, h=h30, center=true, $fn=numlados);
        rotate([90,0,0])
        translate([-48, 15, 80])
        cylinder(r=r10, h=h30, center=true, $fn=numlados);
        //Derecha
        rotate([90,0,0])
        translate([20, 15, 80])
        cylinder(r=r10, h=h30, center=true, $fn=numlados);
        rotate([90,0,0])
        translate([48, 15, 80])
        cylinder(r=r10, h=h30, center=true, $fn=numlados);
        //Base
        translate([6, -60, 10])
         cylinder(r=r2, h=h30, center=true, $fn=numlados);
        translate([-6, -60, 10])
         cylinder(r=r2, h=h30, center=true, $fn=numlados);
        //Atras
        translate([-20, 50, 1])
        cylinder(r=r2, h=h30, center=true, $fn=numlados);
        translate([20, 50, 1])
        cylinder(r=r2, h=h30, center=true, $fn=numlados);
    }

translate([-63, -55, 18])
difference(){
        rotate([0,0,45])
        cylinder(r=r5, h=h28, center=true, $fn=4);
        cylinder(r=r2, h=h40, center=true, $fn=numlados);
}
translate([63, -55, 18])
            difference(){
        rotate([0,0,45])
        cylinder(r=r5, h=h28, center=true, $fn=4);
        cylinder(r=r2, h=h40, center=true, $fn=numlados);
            }
        translate([-13, 60, 10])
            difference(){
        rotate([0,0,45])
        cylinder(r=r5, h=h15, center=true, $fn=4);
        cylinder(r=r2, h=h40, center=true, $fn=numlados);
    }
        translate([13, 60, 10])
            difference(){
        rotate([0,0,45])
        cylinder(r=r5, h=h15, center=true, $fn=4);
        cylinder(r=r2, h=h40, center=true, $fn=numlados);
    }
    
}


