/* Ejercicio4.4 -   Recorrido automático
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
const int estado_joystick = 0; // 1 - No activo | 0 - Activo

const int valorX_bajo = 500;
const int valorX_alto = 560;

// Velocidad eje X
const int velocidad_X_izq = 15; // [0 - 15] mover el actuador a máxima velocidad a la izquierda
const int velocidad_X_der = 1000; // [1000 - 1023] mover el actuador a máxima velocidad a la derecha

// Sensores de colisión
const int pin_colisionIzq = 6; // pin digital para el sensor de colisión de la izda
const int pin_colisionDer = 5; // pin digital para el sensor de colisión de la dcha
const int estado_colision = 0; // 1 - No activo | 0 - Activo

boolean modo = false; // modo = falso -> se controla manualmente
boolean desplazar_derecha = false;

void setup() {
  Serial.begin(9600);
  servo.attach(pin_servo);
  pinMode(pin_joystick, INPUT_PULLUP); // Se usa la resistencia interna del Arduino 
  pinMode(pin_colisionIzq, INPUT);
  pinMode(pin_colisionDer, INPUT);
  desplazar_derecha = true;
}

void loop() {
  
  int valorX = analogRead(pin_X);
  int valorJoystick = digitalRead(pin_joystick);
  int valorIzquierda = digitalRead(pin_colisionIzq);
  int valorDerecha = digitalRead(pin_colisionDer);
  getEstadoJoystick(valorJoystick);

  if (modo) { // modo automático
    moverActuador();
  }else { // modo manual
    if(valorX < valorX_bajo){
      if(valorIzquierda != LOW){
        mover_izquierda(valorX);
      }
    }else if(valorX > valorX_alto){
      if(valorDerecha != LOW){
        mover_derecha(valorX);
      }
    }else{
      servo.write(servo_valor_detenerse);
    }
  }
  
}

void getEstadoJoystick(int valorJoystick){
  if (valorJoystick == estado_joystick) { // Comprobar si el botón está pulsado
    modo = !modo;
    delay(500); // delay para evitar que detecte pulsaciones seguidas
  }
}

void moverActuador() {
  
  int valor_colisionIzq = digitalRead(pin_colisionIzq);
  int valor_colisionDer = digitalRead(pin_colisionDer);
  
  if (desplazar_derecha) {
    
    if (valor_colisionIzq == 0) {
      desplazar_derecha = true;
    }
    mover_derecha(velocidad_X_der);
  
  if (valor_colisionDer == 0) {
      desplazar_derecha = false;
    }
  }
  else {
    if (valor_colisionDer == 0) {
      desplazar_derecha = false;
    }
    
    mover_izquierda(velocidad_X_izq);
  if (valor_colisionIzq == 0) {
      desplazar_derecha = true;
    }
  }
}

void mover_izquierda(int valorX) {
  
  if (valorX > velocidad_X_izq) {
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
