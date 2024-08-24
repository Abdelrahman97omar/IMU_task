#include <Adafruit_BNO08x.h>
#define BNO08X_RESET -1
Adafruit_BNO08x bno08x(BNO08X_RESET);
sh2_SensorValue_t sensorValue;
float roll,pitch,yaw;
float referanceYaw;
bool findRefYaw=false;

void setup(void) {
  bno08x.begin_I2C();
  Serial.begin(115200);
  setReports();
  if(findRefYaw){setStartingAngle();}
  delay(100);
}

void setReports(void) {
  //bno08x.enableReport(SH2_LINEAR_ACCELERATION,100000);
  // bno08x.enableReport(SH2_GYROSCOPE_CALIBRATED,15000);
  bno08x.enableReport(SH2_ROTATION_VECTOR,20000);
  findRefYaw=true;
  // bno08x.enableReport(SH2_GYRO_INTEGRATED_RV,20000);
  }
  void setStartingAngle()
  {
  Serial.println("in setStartingAngle function");
  while (true) {
    if (bno08x.getSensorEvent(&sensorValue)) {
      if (sensorValue.sensorId == SH2_ROTATION_VECTOR) {
        float qx = sensorValue.un.rotationVector.i;
        float qy = sensorValue.un.rotationVector.j;
        float qz = sensorValue.un.rotationVector.k;
        float qr = sensorValue.un.rotationVector.real;
        referanceYaw = (atan2(2 * (qr * qz + qx * qy), 1 - 2 * (qy * qy + qz * qz))) * 57.2958;
        Serial.print("referanceYaw:  ");
        Serial.println(referanceYaw);
        break;  
      }
    }
  }
 }
void loop() {
  delay(10);
  if (bno08x.wasReset()) {setReports();}
  while (bno08x.getSensorEvent(&sensorValue)) {

    switch (sensorValue.sensorId) {
      // case SH2_GYROSCOPE_CALIBRATED:
      // Serial.print("Gyr x:");
      // Serial.print(sensorValue.un.gyroscope.x);
      // Serial.print("  Gyr y:");
      // Serial.print(sensorValue.un.gyroscope.y);
      // Serial.print("  Gyr z:");
      // Serial.println(sensorValue.un.gyroscope.z);
      //   break;

      //  case SH2_LINEAR_ACCELERATION:
      //  Serial.print("ACCELEROMETER: ");
      //  Serial.println(sensorValue.un.linearAcceleration.x);
      // Serial.print("  Acc y:");
      // Serial.print(sensorValue.un.linearAcceleration.y);
      // Serial.print("  Acc z:");
      // Serial.println(sensorValue.un.linearAcceleration.z);
       break;
      case SH2_ROTATION_VECTOR:
      Serial.print("Rot x:");
      Serial.print(sensorValue.un.rotationVector.i);
      float x=sensorValue.un.rotationVector.i;
      Serial.print("  Rot y:");
      Serial.print(sensorValue.un.rotationVector.j);
      float y=sensorValue.un.rotationVector.j;
      Serial.print("  Rot z:");
      Serial.print(sensorValue.un.rotationVector.k);
      float z=sensorValue.un.rotationVector.k;
      Serial.print("  Rot w:");
      Serial.println(sensorValue.un.rotationVector.real);
      float r=sensorValue.un.rotationVector.real;

      // roll=(atan2(2*(r*x+y*z),1-(2*(x*x+y*y))))*57.2958;
      // pitch = asin(-2.0 * (r * y - z * x)) * 57.2958;
      yaw =(atan2(2*(r*z+x*y),1-(2*(y*y+ z*z))))*57.2958-referanceYaw;
      Serial.println(yaw);
      break;
      //   case SH2_GYRO_INTEGRATED_RV:
      // Serial.print("Rot x:");
      //   Serial.print(sensorValue.un.gyroIntegratedRV.i);
      // Serial.print("  Rot y:");
      //   Serial.print(sensorValue.un.gyroIntegratedRV.j);
      // Serial.print("  Rot z:");
      //   Serial.print(sensorValue.un.gyroIntegratedRV.k);
      // Serial.print("  Rot w:");
      //   Serial.println(sensorValue.un.gyroIntegratedRV.real);
      //   break;
      }
  }}
  
