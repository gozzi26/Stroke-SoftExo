int Xpin = A0;
int Ypin = A1;
int Zpin = A2;


int x_calib;
int y_calib;
int z_calib;



void setup() {
Serial.begin(9600);
delay(3000);

x_calib = analogRead(Xpin);
y_calib = analogRead(Ypin);
z_calib = analogRead(Zpin);

}


void loop() {

  // read the value from the sensor:

  int x_prevcalib = analogRead(Xpin);
  int y_prevcalib = analogRead(Ypin);
  int z_prevcalib = analogRead(Zpin);

  //calibration
  int AccX = x_prevcalib - x_calib;
  int AccY = y_prevcalib - y_calib;
  int AccZ = z_prevcalib - z_calib;

  String toPrint = String(AccX) + "$" + String(AccY) + "$" + String(AccZ);
  Serial.print(x_prevcalib);
  Serial.print(",");
  Serial.print(y_prevcalib);
  Serial.print(",");
  Serial.println(z_prevcalib);
  
  
  delay(10);
}
