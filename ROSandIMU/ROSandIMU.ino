
#include <Adafruit_BNO08x.h>
#include <ros.h>
#include <std_msgs/Float32MultiArray.h>
#include <std_msgs/Float32.h>
#include <sensor_msgs/Imu.h>
#include <Wire.h>
#include <math.h>

#define BNO08X_RESET -1

Adafruit_BNO08x bno08x(BNO08X_RESET);
sh2_SensorValue_t sensorValue;
bool accReceived=false;
bool gyroReceived=false;
bool rotReceived=false;

sensor_msgs::Imu sensor_data; 
ros::NodeHandle nh;
ros::Publisher pub("sensor_data", &sensor_data);

void setup(void) {
    Wire.begin();
    Wire.setClock(400000); 
    bno08x.begin_I2C();
    Serial.begin(115200);
    nh.initNode();
    nh.advertise(pub);
    setReports();   
    delay(100);
}

void setReports(void) {
  bno08x.enableReport(SH2_ACCELEROMETER,20000);
  bno08x.enableReport(SH2_GYROSCOPE_CALIBRATED,15000);
  bno08x.enableReport(SH2_ROTATION_VECTOR,10000);
  }

void loop() {
    if (bno08x.wasReset()) { setReports(); }
    
    while (bno08x.getSensorEvent(&sensorValue))
    {
    switch (sensorValue.sensorId) {
       case SH2_ACCELEROMETER:
        sensor_data.linear_acceleration.x = sensorValue.un.accelerometer.x;
        sensor_data.linear_acceleration.y = sensorValue.un.accelerometer.y;
        sensor_data.linear_acceleration.z = sensorValue.un.accelerometer.z;
        sensor_data.linear_acceleration_covariance[0]=0.0162471;
      accReceived=true;
        break;
       case SH2_ROTATION_VECTOR:
        sensor_data.orientation.x=sensorValue.un.rotationVector.i;
        sensor_data.orientation.y=sensorValue.un.rotationVector.j;
        sensor_data.orientation.z=sensorValue.un.rotationVector.k;
        sensor_data.orientation.w=sensorValue.un.rotationVector.real;
        // sensor_data.orientation_covariance[0]=i_start;
        // sensor_data.orientation_covariance[1]=j_start;
        // sensor_data.orientation_covariance[2]=k_start;
        // sensor_data.orientation_covariance[3]=w_start;
        // sensor_data.orientation_covariance[4]=
        // sensor_data.orientation_covariance[5]=
        // sensor_data.orientation_covariance[6]=
        // sensor_data.orientation_covariance[7]=
        sensor_data.orientation_covariance[8]=0.0000000787;
        rotReceived=true;
        break;
      case SH2_GYROSCOPE_CALIBRATED:
        sensor_data.angular_velocity.x=sensorValue.un.gyroscope.x;
        sensor_data.angular_velocity.y=sensorValue.un.gyroscope.y;
        sensor_data.angular_velocity.z=sensorValue.un.gyroscope.z;
        sensor_data.angular_velocity_covariance[2]=0.0000237068;
        gyroReceived=true;
        break;    
    }
    if(rotReceived && gyroReceived && accReceived)
    {
      rotReceived=false;
      gyroReceived=false;
      accReceived=false;
      sensor_data.header.frame_id="base_link";
      sensor_data.header.stamp=nh.now();
      pub.publish(&sensor_data);
      nh.spinOnce();
    }
    }

}
