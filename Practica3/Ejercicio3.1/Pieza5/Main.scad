use <Helices.scad>
use <ParteCentral.scad>
use <Tornillos.scad>
union(){
    //Parte Central
    translate([50,50,10])
    colocacionParteArriba();
    rotate([0,0,50])
    translate([0,0,20])
    conjunto();
    translate([70,80,11])
    cilindroUnoFinal();
    translate([70,-80,5])
    cilindroDosFinal();
    
    //Helices
    rotate([0,180,0])
    translate([-10,-98,0])
    helice();
    
    rotate([0,180,90])
    translate([-10,-98,0])
    helice();
    
    rotate([0,180,180])
    translate([-10,-98,0])
    helice();
    
    rotate([0,180,270])
    translate([-10,-98,0])
    helice();
    
    
    //Tornillos
    translate([41,0,5])
    cilindro();
    translate([-41,0,5])
    cilindro();
    translate([0,-41,5])
    cilindro();
    translate([0,41,5])
    cilindro();

}