h = 20;
d = 5;
fn = 30;

soporte();

module soporte(){
  difference(){
      
      // Base
      cube([100,80,4]); //base rectangular
      
      for(i = [1 : 2 : 9]){ //creo primeramente las "4" primeros agujeros en la primer fila y luego voy creando las columnas. voy creando una especie de matriz de agujeros 5x5
          
       // Primera fila
      translate([10*i,10 ,-2])
        cylinder(h= h, d = d, $fn=fn);
      
      // Segunda fila
      translate([10*i,30,-2])
        cylinder(h= h, d = d, $fn=fn);

      // Tercera fila
      translate([10*i,50,-2])    
        cylinder(h= h, d = d, $fn=fn);

      // Cuarta fila
      translate([10*i,70,-2])     
        cylinder(h= h, d = d, $fn=fn);

      // Quinta fila
      translate([10,90,-2])
        cylinder(h= h, d = d, $fn=fn);
      
      }
    
  }
}
