use <soporteRuedas.scad> 
use <motor.scad>
use <parteSuperior.scad>
use <rueda.scad>

// Ruedas traseras
translate([20,82,20])
  rotate([90,0,0])
    rueda();

translate([20,-18,20])
  rotate([90,0,0])
    rueda();
    
 //Eje trasero
translate([20,30,20])
  rotate([90,0,0])
    cylinder (h = 110, d = 5, center = true);
    
//Ruedas delanteras
translate([80,82,20])
  rotate([90,0,0])
    rueda();

translate([80,-18,20])
  rotate([90,0,0])
    rueda();

//Eje delantero
translate([80,30,20])
  rotate([90,0,0])
    cylinder (h = 110, d = 5, center = true);
    
// Plancha
translate([0,-11.5,30])
 soporte();
 
 //Sujecion rueda delantera izquierda
rotate([180,360,90])
  translate([-1,80,-30])
    soporteRueda();

//Sujecion rueda delantera derecha
rotate([180,360,90])
  rotate([0,0,180])
    translate([-60,-80,-30])
      soporteRueda();

// soporte motor 
rotate([90,0,0])
  translate([0,10,-32])
    cabinaMotor();
    
rotate([90,0,0])
  translate([0,10,-69])
    cabinaMotor();

