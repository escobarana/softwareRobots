/* Ejercicio4.2 -  Dos niveles de velocidad
  Ana Escobar Llamazares
  Alberto Freije Carballo
  Luis Carlos Hurlé Fleitas
*/
#include <Servo.h>
Servo servo;

int pin_servo = 7;
const int servo_valorMax_izq = 0;
const int servo_valorMax_der = 180;
const int servo_valor_detenerse = 90;
const int servo_valorMin_izq = 80;
const int servo_valorMin_der = 100; 

const int pin_X = A0; // Eje X
const int pin_joystick = 8; // Botón joystick


const int valorX_bajo = 500;
const int valorX_alto = 560;

// Velocidad eje X
const int velocidad_X_izq = 15; // [0 - 15] mover el actuador a máxima velocidad a la izquierda
const int velocidad_X_der = 1000; // [1000 - 1023] mover el actuador a máxima velocidad a la derecha

void setup() {
  Serial.begin(9600);
  servo.attach(pin_servo);
  pinMode(pin_joystick, INPUT_PULLUP); // Se usa la resistencia interna del Arduino 
}

void loop() {
  int valorX = analogRead(pin_X);

  if(valorX < valorX_bajo){
    mover_izquierda(valorX);
  }else if(valorX > valorX_alto){
    mover_derecha(valorX);
  }else{
    servo.write(servo_valor_detenerse);
  }
  
}

void mover_izquierda(int valorX) {
  
  if (valorX> velocidad_X_izq) {
    Serial.println(" --- Moviendo de forma lenta a la izquierda --- ");
    servo.write(servo_valorMin_izq);
  }else {
    Serial.println(" --- Moviendo de forma rápida a la izquierda --- ");
    servo.write(servo_valorMax_izq );
  }
  
}

void mover_derecha(int valorX) {
  
  if (valorX < velocidad_X_der) {
    Serial.println(" --- Moviendo de forma lenta a la derecha --- ");
    servo.write(servo_valorMin_der);
  }else {
    Serial.println(" --- Moviendo de forma rápida a la derecha --- ");
    servo.write(servo_valorMax_der);
  }
  
}
