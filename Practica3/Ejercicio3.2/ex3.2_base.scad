// Variables declaration
cyl_height = 67;

cube = 67;
cubeHeight = 4;
cubeLength = 67;

servo = 20;
servoLength = 15;
servoHeight =15;

screwbLenght = 6;
screwbHeight = 6;

extrasHeight = 4;
screwsLength = 6;
screwsHeight = 6;

// Operations
module base(){
    union(){
        difference(){
            translate([0,0,cyl_height/2+ cubeHeight/2] )
                cylinder (h = cyl_height, d = cubeLength - 10, center = true,$fn=300);
            translate([0,servo/2+screwsLength/2+extrasHeight,cubeHeight/2+cyl_height-screwsHeight/2+1])
                cylinder (h = screwsHeight, d = screwsLength, center = true,$fn=300);
        }
        difference(){
            rotate([90,0,0])
                cube ([cubeLength,cubeHeight,cube], center = true);
            translate([(cubeLength/2-screwbLenght),-(cubeLength/2-screwbLenght),0])
                cylinder (h = screwbHeight, d = screwbLenght, center = true,$fn=300);
            translate([-(cubeLength/2-screwbLenght),cubeLength/2-screwbLenght,0])
                cylinder (h = screwbHeight, d = screwbLenght, center = true,$fn=300);
            translate([cubeLength/2-screwbLenght,cubeLength/2-screwbLenght,0])
                cylinder (h = screwbHeight, d = screwbLenght, center = true,$fn=300);        
            translate([-(cubeLength/2-screwbLenght),-(cubeLength/2-screwbLenght),0])
                cylinder (h = screwbHeight, d = screwbLenght, center = true,$fn=300);
        }  
    }
}
base();