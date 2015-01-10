import processing.serial.*;

Serial port;
String portname = "/dev/tty.usbmodemfa131";//"COM3";  
int baudrate = 9600;
int value = 0;  

void setup(){

  port = new Serial(this, portname, baudrate);
  println(port);

}

void draw(){

  if(keyPressed) {
    if (key == '0') {
      port.write ("0");
      port.write ("L");
    }
    if (key == '1') {
      port.write ("1");
      port.write ("H");
    }
    if (key == '2') {
      port.write ("2");
    }
    if (key == '3') {
      port.write ("3");
    }
    if (key == '4') {
      port.write ("4");
    }
    if (key == '5') {
      port.write ("5");
    }
  } 
}
