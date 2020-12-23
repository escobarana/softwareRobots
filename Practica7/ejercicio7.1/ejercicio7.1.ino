/* Ejercicio7.1 - Sigue Líneas
  Ana Escobar Llamazares
  Alberto Freije Carballo
  Luis Carlos Hurlé Fleitas
*/
#include <Servo.h>
Servo servoIzq;
Servo servoDer;

const int pin_sensor_izquierda = 2; 
const int pin_sensor_derecha = 3; 
const int pin_motor_izquierda = 8; 
const int pin_motor_derecha = 9; 

const int NO_LINEA = 0; // FALSE
const int LINEA = 1;  // TRUE

void setup(){
  
  pinMode(pin_sensor_izquierda, INPUT);
  pinMode(pin_sensor_derecha, INPUT);
  
  pinMode(pin_motor_izquierda, OUTPUT);
  pinMode(pin_motor_derecha, OUTPUT);
    
  servoIzq.attach(pin_motor_izquierda);
  servoDer.attach(pin_motor_derecha);

}

void loop() {
  
    int resultado_izquierda = digitalRead(pin_sensor_izquierda);
    int resultado_derecha = digitalRead(pin_sensor_derecha);

    if ((resultado_izquierda == LINEA) && (resultado_derecha == LINEA)) {
        avanzar(100);
    }else if ((resultado_izquierda == NO_LINEA) && (resultado_derecha == LINEA)) {
        girar_izquierda(100);
    }else if ((resultado_izquierda == LINEA) && (resultado_derecha == NO_LINEA)) {
        girar_derecha(100);
    }else{
		stop();
	}
	
}

void avanzar(int num) {
    servoIzq.write(0);
    servoDer.write(180);
    delay(num);
}

void girar_derecha (int num) {
    servoIzq.write(125);
    servoDer.write(125);
    delay(num);
}

void girar_izquierda(int num) {
    servoIzq.write(45);
    servoDer.write(45);
    delay(num);
}

void stop() {
  servoIzq.write(90);
  servoDer.write(90);
}
