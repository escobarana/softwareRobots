/* Sensores y actuadores - Ejercicio 1
  Ana Escobar Llamazares
  Alberto Freije Carballo
  Luis Carlos Hurlé Fleitas
*/
#include <Keypad.h>

//leds
int ledRojo = 9;
int ledVerde = 8;

//teclado
const byte nfilas = 4; 
const byte ncolumnas = 4; 
char teclas[nfilas][ncolumnas] = { 
  {'1','2','3','A'}, 
  {'4','5','6','B'}, 
  {'7','8','9','C'}, 
  {'*','0','#','D'} 
};

byte pfilas[nfilas] = {2, 3, 4, 5};// Filas 
byte pcolumnas[ncolumnas] = {A0, A1, A2, A3}; //Columnas

Keypad teclado = Keypad(makeKeymap(teclas), pfilas, pcolumnas, nfilas, ncolumnas);

void setup()
{
  Serial.begin (9600);
  
  pinMode(ledRojo, OUTPUT);
  pinMode(ledVerde, OUTPUT);
}

void loop()
{
 digitalWrite(ledVerde, HIGH); 
 char tecla = teclado.getKey(); 
  if (tecla == 'A'){
    digitalWrite(ledVerde, LOW); 
    digitalWrite(ledRojo, HIGH);
    delay(5000);
    digitalWrite(ledRojo, LOW);
  }
}
