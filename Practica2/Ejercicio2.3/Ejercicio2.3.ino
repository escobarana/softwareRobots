/* Sensores y actuadores - Ejercicio 3
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


int entradas = 0;
int acertadas = 0;

char contrasena[] = {'9', '8', '7', '6'};
char probarContrasena[4];


char teclas[nfilas][ncolumnas] = { 
  {'1','2','3','A'}, 
  {'4','5','6','B'}, 
  {'7','8','9','C'}, 
  {'*','0','#','D'} 
};

byte pfilas[nfilas] = {2, 3, 4, 5};// Filas 
byte pcolumnas[ncolumnas] = {A0, A1, A2, A3}; //Columnas

Keypad teclado = Keypad(makeKeymap(teclas), pfilas, pcolumnas, nfilas, ncolumnas);

unsigned long tiempoActual = 0;

bool abierto = false;

void setup()
{
  Serial.begin (9600);
  
  pinMode(ledRojo, OUTPUT);
  pinMode(ledVerde, OUTPUT);
  digitalWrite(ledVerde, HIGH); 
}

void loop()
{
    pulsaTecla(); 
}
    
  void pulsaTecla(){
    
    char tecla = teclado.getKey(); //coges la tecla  pulsada
     
    Serial.print("Entradas  " + entradas);
    Serial.print("Acertadas  " + acertadas);
    
    if(entradas<4 && tecla != '\0'){ 
      Serial.print("Entra aqui  ");
      Serial.print(tecla); //imprimo para saber que tecla esta pulsada
      probarContrasena[entradas] = tecla; //añado en el array a comparar la tecla pulsada
      entradas++;
    }
    
    if(entradas==4){
      
      for(int i=0; i<4;i++){ //comparo las dos contrasenas
        
        if(contrasena[i] == probarContrasena[i]){
           acertadas++;
        }
        
      }
      
      if(acertadas==4 && abierto == false){
        digitalWrite(ledVerde, LOW);
        delay(1000);
        digitalWrite(ledRojo, HIGH);
        tiempoActual = millis();
        abierto=true;
        entradas=0;

      }
      else if(acertadas<4){
        falla();
        entradas=0;
      }
      
      acertadas=0;
      
    }
    
    long tiempoFinPrograma = millis();
    
     if(tiempoFinPrograma - tiempoActual >= 2500 && abierto){
      digitalWrite(ledRojo, LOW);
      digitalWrite(ledVerde, HIGH); 
      abierto=false;
    }
    
     if(tecla == 'C' && abierto == true){
       digitalWrite(ledRojo, LOW);
       digitalWrite(ledVerde, HIGH); 
       abierto=false;
       
     }
     
     
   }


 void falla(){
       digitalWrite(ledVerde, HIGH);
       delay(500);
       digitalWrite(ledVerde, LOW);
       delay(500);
       digitalWrite(ledVerde, HIGH);
       delay(500);
       digitalWrite(ledVerde, LOW);
       delay(500);
       digitalWrite(ledVerde, HIGH);
       delay(500);
       digitalWrite(ledVerde, LOW);
       delay(500);
       digitalWrite(ledVerde, HIGH);
  }
