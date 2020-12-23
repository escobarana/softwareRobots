//modulo legpartv3
altura_50 = 50;
altura_3 = 3;
altura_5 = 5;
altura_15 = 15;
lados = 200;
r1_5 = 1.5;
r0_5 = 0.5;
r2_5 = 2.5;
r5 = 5;

module legpartv3(){
    
    difference(){
    translate([0,23,5])
      cube ([40,3,10], center = true);
    translate([0,30,5])
        rotate([90,0,0])
            cylinder(h =altura_50,r=r1_5,$fn=lados);
    translate([-9,30,5])
        rotate([90,0,0])
            cylinder(h =altura_50,r=r0_5,$fn=lados);
    translate([9,30,5])
        rotate([90,0,0])
            cylinder(h =altura_50,r=r0_5,$fn=lados);    
}
   
    translate([-18.5,12,5])
           cube ([3,24,10], center = true);
    rotate([90,0,90])
        translate([0, 5, -18.5])
            cylinder(h=7, r=r2_5,$fn=lados);
    
    rotate([90,0,90])
     translate([0, 5, -18.5])
            cylinder(h=altura_3, r=r5,$fn=lados, center = true);

difference(){
     translate([18.5,12,5])
        cube ([3,24,10], center = true);
     rotate([90,0,90])
        translate([7.5, 5, 18.5])
            cylinder(h=altura_5, r=r0_5,$fn=lados, center = true);
     rotate([90,0,90])
        translate([12.5, 5, 18.5])
            cylinder(h=altura_5, r=r0_5,$fn=lados, center = true);
    rotate([90,0,90])
        translate([0, 5, 18.5])
            cylinder(h=altura_15, r=r2_5,$fn=lados, center = true);
}

difference(){
    rotate([90,0,90])
        translate([0, 5, 18.5])
            cylinder(h=altura_3, r=r5,$fn=lados, center = true);
    rotate([90,0,90])
        translate([0, 5, 18.5])
            cylinder(h=altura_15, r=r2_5,$fn=lados, center = true);
}


    

    
    
}

