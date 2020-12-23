/* Memoria1.2 - Juego de memoria
  Ana Escobar Llamazares
  Alberto Freije Carballo
  Luis Carlos Hurlé Fleitas
*/
// Pins
const int boton_rojo = 2;
const int boton_verde = 5;
const int led_rojo = 3;
const int led_verde = 4;

int boton_rojo_pulsado = 0;
int boton_verde_pulsado = 0;

const int MAX_COLOR_SEQUENCE_SIZE = 8;
const int INITIAL_COLOR_SEQUENCE_SIZE = 3;
int coloresSecuencia[8]; 
int sizeSecuencia;
int numColores_Aciertos = 0;

void setup() {
  Serial.begin(9600);
  pinMode(boton_rojo, INPUT);
  pinMode(boton_verde, INPUT);
  pinMode(led_rojo, OUTPUT);
  pinMode(led_verde, OUTPUT);
  randomSeed(analogRead(0));
  generarSecuenciaAleatoria();
  mostrarSecuencia();
}

void loop() {

  if (comprobarRojo()) {
    intentoUsuario(led_rojo);
  }else if (comprobarVerde()) {
    intentoUsuario(led_verde);
  }

}

void intentoUsuario(int led_pulsado) {

  int expectedLed = coloresSecuencia[numColores_Aciertos];

  // Acieto
  if (led_pulsado == expectedLed) {
    numColores_Aciertos++;
    comprobarFinSecuencia();
  }else { // Fallo
	numColores_Aciertos = 0;
    generarSecuenciaAleatoria();
    mostrarSecuencia();
  }
}

void comprobarFinSecuencia() { // Usuario ha acertado todos los colores de la secuencia actual

  if (numColores_Aciertos == sizeSecuencia) {

    incrementarSecuencia();
    numColores_Aciertos = 0;
    mostrarSecuencia();
  }
  
}

boolean comprobarRojo() {

  int estado_botonRojo = digitalRead(boton_rojo);
  if (estado_botonRojo == HIGH && boton_rojo_pulsado == 0) {
    boton_rojo_pulsado = 1;
  }else if (estado_botonRojo == LOW && boton_rojo_pulsado == 1) { 
    boton_rojo_pulsado = 0;
    encenderLed(led_rojo);
    return true;
  }
  return false;
  
}

boolean comprobarVerde() {

  int estado_botonVerde = digitalRead(boton_verde);

  if (estado_botonVerde == HIGH && boton_verde_pulsado == 0) {
    boton_verde_pulsado = 1;
  }else if (estado_botonVerde == LOW && boton_verde_pulsado == 1) {
    boton_verde_pulsado = 0;
    encenderLed(led_verde);
    return true;
  }
  return false;
  
}

void mostrarSecuencia() {
 
  for (int i = 0; i < sizeSecuencia; i++) {
    encenderLed(coloresSecuencia[i]);
    delay(1000);
  }
  
}

void encenderLed(int ledColor) {
  digitalWrite(ledColor, HIGH);
  delay(2000);
  digitalWrite(ledColor, LOW);
}

int randomColor() {

  long randomColor = random(2);
  return randomColor == 0L ? led_rojo : led_verde;
  
}

void generarSecuenciaAleatoria() {

  sizeSecuencia = INITIAL_COLOR_SEQUENCE_SIZE;
  for (int i = 0; i < sizeSecuencia; i++) {
    coloresSecuencia[i] = randomColor();
  }
  
}

void incrementarSecuencia() {

  if (sizeSecuencia < MAX_COLOR_SEQUENCE_SIZE) {
    coloresSecuencia[sizeSecuencia] = randomColor();
    sizeSecuencia++;
  }else {
    sizeSecuencia = INITIAL_COLOR_SEQUENCE_SIZE;
    generarSecuenciaAleatoria();
  }
  
}

