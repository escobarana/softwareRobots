/* Dado1.1 - Dado electronico
  Ana Escobar Llamazares
  Alberto Freije Carballo
  Luis Carlos Hurlé Fleitas
*/
int led_1 = 2;
int led_2 = 3;
int led_3 = 4;

int pulsador = 9;

void setup () { //Arduino ejecuta una sola vez lo que esta en setup
   
  //Configurar salidas de los leds
   pinMode (led_1, OUTPUT);
   pinMode (led_2, OUTPUT);
   pinMode (led_3, OUTPUT);    
   
   //Configurar el pin de entrada del pulsador
   pinMode (pulsador, INPUT);
    
   //Inicializa el generador de numeros aleatorios
   randomSeed(analogRead(0));   
    
   //Apaga todos los leds
   digitalWrite (led_1, LOW);
   digitalWrite (led_2, LOW);
   digitalWrite (led_3, LOW); 

}

void escribe_dado (unsigned char num) {
  //Escribe numero en el dado
  switch (num) {
            
    case 1: //Prender el numero 1
            digitalWrite (led_1, HIGH);
            digitalWrite (led_2, LOW);
            digitalWrite (led_3, LOW);           
            break;
            
    case 2: //Prender el numero 2
            digitalWrite (led_1, HIGH);
            digitalWrite (led_2, HIGH);
            digitalWrite (led_3, LOW);
        break;
            
    case 3: //Prender el numero 3
            digitalWrite (led_1, HIGH);
            digitalWrite (led_2, HIGH);
            digitalWrite (led_3, HIGH); 
            break;
       
    default:
    case 0:  //Apagar todos los leds
            digitalWrite (led_1, LOW);
            digitalWrite (led_2, LOW);
            digitalWrite (led_3, LOW);
            break;
            
  }
}


void loop () {

  unsigned int numero;
  
  while (!digitalRead (pulsador));   //Espera a que aprieten pulsador
 
  while(digitalRead(pulsador)== LOW);{//Espera que el pulsador pase a HIGH
  }//Arduino se queda en el while, hasta que alguien presione el pulsador
  escribe_dado (0);              //Apaga todos los leds
  
 while (digitalRead (pulsador));      //Espera a que suelten pulsador
  
  while(digitalRead(pulsador)== HIGH){//Espera que el pulsador pase a LOW
  }// Este ultimo While es el "Antirebote" del pulsador 
  
  numero = random(1, 4);        //Genera un numero al azar entre 1 y 3
  
  escribe_dado (numero);        //Mostrar el numero en el dado
}
