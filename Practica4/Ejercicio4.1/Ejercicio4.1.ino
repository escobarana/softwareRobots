/* Ejercicio4.1 - Actuador lineal teleoperado
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

const int pin_X = A0;

const int valorX_bajo = 500;
const int valorX_alto = 560;

void setup() {
	
  Serial.begin(9600);
  servo.attach(pin_servo);
  
}

void loop() {
 
  int valorX = analogRead(pin_X);
  
  if(valorX < valorX_bajo){
    servo.write(servo_valorMax_izq);
  }else if(valorX > valorX_alto){
    servo.write(servo_valorMax_der);
  }else{
    servo.write(servo_valor_detenerse);
  }
  
}
