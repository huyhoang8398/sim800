int value = 0;
float voltage;
String voltageS;
char serIn;
double temp = 3; // if voltage under 11V
void setup(){
  Serial.begin(9600);
}

void loop(){
  if (Serial.available()>0){ 
    serIn=Serial.read();
    if (serIn=='D'){
      value = analogRead(A0);
      voltage = value * (5.0/1023);
      Serial.print("Voltage =");
      //Serial.println("hello"); // send back voltage data to Pi
      Serial.println(voltage);
    }
    //Serial.println(buff);
  }
    else {
      value = analogRead(A0);
      voltage = value * (5.0/1023);
      if ( voltage <= temp ) {
        Serial.println("Turned off scan device and Sim module"); 
      }
      if (voltage <= 5){
        Serial.println("Turned off Raspberry Pi");
      }
      delay (5000);
    }
}
