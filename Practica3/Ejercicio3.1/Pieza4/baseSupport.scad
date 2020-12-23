module basesupport(){
    //-- Constantes para acceder a las coordenadas X,Y,Z de los vectores
X = 0;
Y = 1;
Z = 2;
 
//-- Parámetros del cubo redondeado
r = 4; //-- Radio de las curvas
A = [40, 20, 30]; //-- Dimensiones del cubo 
 
//-- Calcular las coordenadas en funcion de los parametros del user
a = (A - [2*r, 2*r, 2*r])/2;
 
//-- Obtener las coordenadas. Es un atajo para no escribir tanto
x = a[X];
y = a[Y];
z = a[Z]; 
 
//-- Calcular los vertices del cubo
vertice = [
  [x, y, z],
  [-x, y, z],
  [-x, -y, z],
  [x, -y, z],
  [x, y, -z],
  [-x, y, -z],
  [-x, -y, -z],
  [x, -y, -z],
]; 
 
 
 
//-- Dibujar el cubo redondeado. Se coloca en cada vertice una
//-- esfera de radio r y se aplica el operador hull
difference(){
hull(){
  for (pos = vertice)
    translate(pos)
      sphere(r = r, $fn = 50);
  }
  translate([0,0,-10])
  cube([50,20,10], center=true);
  translate([10,0,-10])
  cylinder(h=20,r=2, $fn = 50);
  translate([-10,0,-10])
  cylinder(h=20,r=2, $fn = 50);
}
}


