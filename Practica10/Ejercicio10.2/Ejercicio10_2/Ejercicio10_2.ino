#include <SPI.h> //Importamos librería comunicación SPI
#include <Ethernet.h> //Importamos librería Ethernet

long responseTime;
long distance;
int pinTrig=9;
int pinEcho=10;
const int pin_colision = 6; // pin digital para el sensor de colisión

byte mac[]={0x54,0x55,0x58,0x10,0x00,0x21};// Tiene que ser única  en  la  red local,
//cuidado, cambiad  el  último  dígito  por  el  de vuestro grupo

EthernetServer servidor(80);//Puerto en el 80
IPAddress dnServer(156,35,14,2);
IPAddress gateway(192,168,61,13);
IPAddress subnet(255,255,255,0);
// Que cada uno ponga la IP de su grupo (20X, dónde X es el número del grupo) 201, 202, 203, que es el que tiene asignado. Tiene que ser única en la red local, cuidado

IPAddress ip(192,168,61,201);

int led =8;
void setup(){
    Serial.begin(9600);
    Ethernet.begin(mac,ip,dnServer,gateway,subnet);
    servidor.begin();
    Serial.println("Setup");
    // Imprimir la IP

    pinMode(pinTrig ,OUTPUT);
    pinMode(pinEcho,INPUT);
    pinMode(pin_colision, INPUT);
    Serial.println(Ethernet.localIP());
    // Inicializar el led
    pinMode(led,OUTPUT);
    digitalWrite(led,LOW);
}

void loop() {
  // put your main code here, to run repeatedly:
  EthernetClient cliente = servidor.available();
String lleno, abierto;
  if (cliente) {

    Serial.println("Nueva peticion");
    String peticion = "";
    while (cliente.connected()) {
      if (cliente.available()) {

        char c = cliente.read(); //Leer  petición carácter a carácter
        peticion.concat(c); // concatenar en un string




        if (c == '\n' && peticion.indexOf("datos") != -1) {
            digitalWrite(pinTrig,LOW);
            delayMicroseconds(5);
            digitalWrite(pinTrig,HIGH);
            delayMicroseconds(10);
            responseTime =pulseIn(pinEcho,HIGH);
            distance =int(0.01716*responseTime);
            if(distance > 10){
                lleno="No";
            }else{
                lleno="Si";
            }
            if(digitalRead(pin_colision) == 0){
                abierto="No";
            }else{
                abierto="Si";
            }

            cliente.println("HTTP/1.1 200");
            cliente.println("Content-Type: application/json");
            cliente.println("Access-Control-Allow-Origin: *");
            cliente.println();
            cliente.println("{\"lleno\" : " + String(lleno) + ", \"abierto\" : " + String(abierto) + "}");
            break;
        }

        if (c == '\n' && peticion.indexOf("encenderLed") != -1) {
          digitalWrite(led, HIGH);
          cliente.println("HTTP/1.1 200");
          cliente.println("Content-Type: application/json");
          cliente.println("Access-Control-Allow-Origin: *");
          cliente.println();
          Serial.println("Encender LED");

          break;

        }

        if (c == '\n' && peticion.indexOf("apagarLed") != -1) {
          digitalWrite(led, LOW);
          cliente.println("HTTP/1.1 200");
          cliente.println("Content-Type: application/json");
          cliente.println("Access-Control-Allow-Origin: *");
          cliente.println();
          Serial.println("Apagar LED");


          break;

        }
      }
    }

    // Pequeña pausa para asegurar el envio de datos
    delay(2000);
    cliente.stop();// Cierra la conexión
  }
      delay(100);

}
