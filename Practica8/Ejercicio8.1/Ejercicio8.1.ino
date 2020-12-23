/* Dado1.1 - Dado electronico
  Ana Escobar Llamazares
  Alberto Freije Carballo
  Luis Carlos Hurlé Fleitas
*/
#include <Servo.h>
Servo servoIzq;
Servo servoDer;

const int pinServoIzq = 8;
const int pinServoDer = 9;

const int pinSensorIzq = 2;
const int pinSensorDer = 3;
const int pinSensorExteriorIzquierda = 10;
const int pinSensorExteriorDerecha = 11;

const int BLANCO = 0;
const int NEGRO = 1;

void setup(){

    pinMode(pinServoIzq, OUTPUT);
    pinMode(pinServoDer, OUTPUT);
    pinMode(pinSensorIzq,INPUT);
    pinMode(pinSensorDer,INPUT);
    pinMode(pinSensorExteriorIzquierda,INPUT);
    pinMode(pinSensorExteriorDerecha,INPUT);
    servoIzq.attach(pinServoIzq);
    servoDer.attach(pinServoDer);

}

void loop(){
    
   if(digitalRead(pinSensorIzq) == BLANCO && digitalRead(pinSensorDer) == BLANCO &&
     digitalRead(pinSensorExteriorIzquierda) == BLANCO && digitalRead(pinSensorExteriorDerecha) == BLANCO){
     retroceder();
   }else if(digitalRead(pinSensorIzq) == NEGRO && digitalRead(pinSensorDer) == NEGRO &&
            digitalRead(pinSensorExteriorIzquierda) == NEGRO && digitalRead(pinSensorExteriorDerecha) == NEGRO){
    parar();
   }else if (digitalRead(pinSensorIzq) == NEGRO && digitalRead(pinSensorDer) == NEGRO &&
            digitalRead(pinSensorExteriorIzquierda) == BLANCO && digitalRead(pinSensorExteriorDerecha) == BLANCO){
    avanzar(); 
  } else if (digitalRead(pinSensorIzq) == BLANCO && digitalRead(pinSensorDer) == NEGRO) {
    girarDerecha();
  } else if (digitalRead(pinSensorIzq) == NEGRO && digitalRead(pinSensorDer) == BLANCO) {
    girarIzquierda();
  }else if(digitalRead(pinSensorIzq) == NEGRO && digitalRead(pinSensorDer) == NEGRO &&
            digitalRead(pinSensorExteriorIzquierda) == BLANCO && digitalRead(pinSensorExteriorDerecha) == NEGRO){
    parar();
    delay(300);
    if(digitalRead(pinSensorIzq) == NEGRO && digitalRead(pinSensorDer) == NEGRO){
      avanzar();
      delay(300);
      if(digitalRead(pinSensorIzq) != NEGRO && digitalRead(pinSensorDer) != NEGRO){
        girarDerecha();
        delay(400);
      }
    }
  }else if(digitalRead(pinSensorIzq) == NEGRO && digitalRead(pinSensorDer) == NEGRO &&
            digitalRead(pinSensorExteriorIzquierda) == NEGRO && digitalRead(pinSensorExteriorDerecha) == BLANCO){
    parar();
    delay(300);
    if(digitalRead(pinSensorExteriorIzquierda) == NEGRO){
        girarIzquierda();
        delay(400);
        avanzar();
        delay(300);
        girarIzquierda();
        delay(100);
    }else{
      avanzar();
      delay(300);
    }
  }
  
}

void retroceder(){
  while(digitalRead(pinSensorIzq) != NEGRO && digitalRead(pinSensorDer)!= NEGRO){
    girarIzquierda();
  }
}

void avanzar() {
  servoDer.write(180);
  servoIzq.write(0);
}

void parar() {
  servoDer.write(90);
  servoIzq.write(90);
}

void girarIzquierda() {
  servoDer.write(180);
  servoIzq.write(180);
}

void girarDerecha() {
  servoDer.write(0);
  servoIzq.write(0);
}
