void setup(){
  Serial.begin(9600);
  pinMode(13, OUTPUT);
}

char myCmd[128];        // max size, 128
int inputSize=0;

void loop(){

  inputSize=0;
  if (Serial.available() > 0) {
    delay(300); //allows time for Serial to collect the data.
    inputSize = Serial.available();

    for (int i = 0; i < inputSize; i++){
      myCmd[i] = Serial.read();
    }
    // say what you got:
    Serial.print("Received: ");
    Serial.println(myCmd);
  }
}


