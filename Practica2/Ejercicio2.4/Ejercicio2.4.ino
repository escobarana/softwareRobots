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

// Variables para el sensor de ultrasonidos
const int EchoPin = 6;
const int TriggerPin = 7;
const int distanciaMaxima = 10; // distancia en cm a partir de la cual se considera que hay algo delante de la puerta


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
bool proximo = false;

void setup()
{
  Serial.begin (9600);
  
  pinMode(ledRojo, OUTPUT);
  pinMode(ledVerde, OUTPUT);
  digitalWrite(ledVerde, HIGH); 
  pinMode(TriggerPin, OUTPUT);
  pinMode(EchoPin, INPUT);
}

void loop()
{
   int cm = ping(TriggerPin, EchoPin);
   //Serial.print("Distancia: ");
   //Serial.println(cm);
   pulsaTecla(cm); 
}

int ping(int TriggerPin, int EchoPin) {
   long duration, distanceCm;
   
   digitalWrite(TriggerPin, LOW);  //para generar un pulso limpio ponemos a LOW 4us
   delayMicroseconds(5);
   digitalWrite(TriggerPin, HIGH);  //generamos Trigger (disparo) de 10us
   delayMicroseconds(15);
   digitalWrite(TriggerPin, LOW);
   
   duration = pulseIn(EchoPin, HIGH);  //medimos el tiempo entre pulsos, en microsegundos
   
   distanceCm = duration * 10 / 292/ 2;   //convertimos a distancia, en cm
   return distanceCm;
}

  
  void pulsaTecla(int cm){
    
    if(cm <= distanciaMaxima){
      
      //Serial.print(" Puto alejesee -");
      proximo = true;
      
    }
    else{
      //Serial.print(" Quedese lejooos -");
      proximo = false;
    }
    
    char tecla = teclado.getKey(); //coges la tecla  pulsada
     
  
    if(entradas<4 && tecla != '\0' && tecla != 'C'){  //el valor '\0' es el valor de la tecla inicialmente y siempre entra en el bucle asi que hay que restringirlo
      Serial.print("Entra aqui  ");
      Serial.print(tecla); //imprimo para saber que tecla esta pulsada
      probarContrasena[entradas] = tecla; //añado en el array a comparar la tecla pulsada
      entradas++;
    }
    
    if(entradas==4){
      
      for(int i=0; i<4;i++){ //comparo las dos contrasenas
        
        if(contrasena[i] == probarContrasena[i]){
           acertadas++; //si son iguales acierta
        }
        
      }
      
      if(acertadas==4 && abierto == false){ //si hay cuatro iguales y no esta abierta
        digitalWrite(ledVerde, LOW);
        delay(1000);
        digitalWrite(ledRojo, HIGH);
        tiempoActual = millis();
        abierto=true;
        entradas=0;

      }
      else if(acertadas<4){ //si fallaste en la contraseña
        falla();
        entradas=0;
      }
      
      acertadas=0;
      
    }
    
    
     if(tecla == 'C' && abierto == true && proximo == false){
       digitalWrite(ledRojo, LOW);
       digitalWrite(ledVerde, HIGH); 
       abierto=false;
       
     }
   
    if(proximo ==true){
      tiempoActual = millis();
    }
   
    if(proximo == false){
      long tiempoFinPrograma = millis();
      if(tiempoFinPrograma - tiempoActual >= 1000 && abierto){
      digitalWrite(ledRojo, LOW);
      digitalWrite(ledVerde, HIGH); 
      abierto=false;
    }
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
