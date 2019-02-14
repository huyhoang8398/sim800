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
      voltage = value * (5.0/1023) *12/5;
//      Serial.print("Voltage =");
      Serial.println(voltage);
    }
  }
}
