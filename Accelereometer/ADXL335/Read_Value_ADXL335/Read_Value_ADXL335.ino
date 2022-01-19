int xpin = A0; 
int ypin = A1; 
int zpin = A2; 
float x_calib;
float y_calib;
float z_calib;

void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:
int x = analogRead(xpin); //read from xpin
int y = analogRead(ypin); //read from ypin
int z = analogRead(zpin); //read from zpin

x_calib = (((float)x - 341)/68*9.8);
y_calib =(((float)y - 338)/68*9.8);
z_calib = (((float)z - 418)/68*9.8);


delay(200);
 //Serial.println(x_calib);
 //Serial.println(y_calib);
 Serial.println(z_calib);
}
