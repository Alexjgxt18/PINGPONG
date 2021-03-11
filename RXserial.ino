int data = 0;
char dataC;

void setup() {
  // initialize serial:
  Serial.begin(9600);
    while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }
  establishContact();
  
}

void loop() {
 
  if (Serial.available() > 0) {

    data = Serial.read();  
    Serial.println(data,DEC);
    Serial.write(data); 


  }
}
void establishContact() {
  while (Serial.available() <= 0) {
    Serial.print('A');   // send a capital A
    delay(300);
  }
}
