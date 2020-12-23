// Variables declaration

box_x = 40;
box_y = 60;
box_z = 30;

servo_x = 11;
servo_y = 22;
servo_z = 16;

screwPlaceDiam = 6;
screwPlaceHeight = 3;

servoScrewDiameter = 5;
servoScrewHeight = 10;
screwServoSpace = 2;
screwsAndServo = 32;

toolHeight = 60;
toolDiameter = 6;
toolSpace = 1;

// Operations

module box(){
    difference(){
        cube([box_x, box_y, box_z], center=true);
        translate([0, (box_y/2)-(screwsAndServo/2), -(box_z/2)+(servo_z/2)-0.01]){
            union(){
                cube([servo_x, servo_y, servo_z], center=true);
                translate([0, -(servo_y/2)-(servoScrewDiameter/2)-screwServoSpace, -(servo_z/2)+(servoScrewHeight/2)]){
                    cylinder(d=servoScrewDiameter, h=servoScrewHeight, $fn=200, center=true);
                }
                translate([0, +(servo_y/2)+(servoScrewDiameter/2)+screwServoSpace, -(servo_z/2)+(servoScrewHeight/2)]){
                    cylinder(d=servoScrewDiameter, h=servoScrewHeight, $fn=200, center=true);
                }
            }
        }
        translate([0,(-box_y/2)+(toolDiameter/2)+toolSpace,0]){
            cylinder(h=toolHeight, d=toolDiameter, $fn=200, center=true);
        }
        translate([0,(-box_y/2)+(screwPlaceHeight/2)-0.01,0]){
            rotate([90, 0, 0]){
             cylinder(h=screwPlaceHeight, d=screwPlaceDiam, $fn=200, center=true);
            }
        }   
    }
}
box();