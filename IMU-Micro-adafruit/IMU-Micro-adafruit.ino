#include <micro_ros_arduino.h>
#include <rcl/rcl.h>
#include <rcl/error_handling.h>
#include <rclc/rclc.h>
#include <rclc/executor.h>
#include <sensor_msgs/msg/imu.h>
#include <Wire.h>
#include <Adafruit_BNO08x.h>

rcl_publisher_t publisher;
rclc_executor_t executor;
rclc_support_t support;
rcl_allocator_t allocator;
rcl_node_t node;
rcl_timer_t timer;
bool isAcc=false;
bool isGyro=false;
bool isRot=false;

#define RCSOFTCHECK(fn) { rcl_ret_t temp_rc = fn; if((temp_rc != RCL_RET_OK)){}}
#define BNO08X_RESET -1
sensor_msgs__msg__Imu imuReadings;
sh2_SensorValue_t sensorValue;
Adafruit_BNO08x bno08x(BNO08X_RESET);


void timer_callback(rcl_timer_t * timer, int64_t last_call_time)
{      
  if (timer != NULL) {
  //RCLC_UNUSED(last_call_time); mesh mohem, just macro to indicate that last_call_time is unused to avoid compiler warnings
   //from rcl/rcl.h in timer.h
   //param[in] period the duration between calls to the callback in nanoseconds
    if(isAcc && isGyro && isRot)
    {
    bool isAcc=false;
    bool isGyro=false;
    bool isRot=false;
    // sensor_data.header.frame_id="imu_link";
    // sensor_data.header.stamp=nh.now();
    rcl_publish(&publisher, &imuReadings, NULL);
    }
  }
}



void setReports(void) {
  bno08x.enableReport(SH2_LINEAR_ACCELERATION,20000);
  bno08x.enableReport(SH2_GYROSCOPE_CALIBRATED,15000);
  // bno08x.enableReport(SH2_ROTATION_VECTOR,10000);
  bno08x.enableReport(SH2_GAME_ROTATION_VECTOR,10000);
  //bno08x.enableReport(SH2_GYRO_INTEGRATED_RV,20000);
}

void setup() {
  set_microros_transports();
  allocator = rcl_get_default_allocator();
  rclc_support_init(&support, 0, NULL, &allocator);  // Create init_options
  rclc_node_init_default(&node, "micro_ros_arduino_node", "", &support);  // Create node
  // Create publisher
  // NOTEEEE, from file type_utilties.h, the function's ROSIDL_GET_MSG_TYPE_SUPPORT third arg is the buffer size for the msg
  rclc_publisher_init_default(&publisher,&node,ROSIDL_GET_MSG_TYPE_SUPPORT(sensor_msgs, msg, Imu),"sensor_data");
  const unsigned int timer_timeout = 20;    //for pub. frequancy = 100 Hz 
  rclc_timer_init_default(&timer, &support, RCL_MS_TO_NS(timer_timeout), timer_callback);
  rclc_executor_init(&executor, &support.context, 1, &allocator);  // Create executor
  rclc_executor_add_timer(&executor, &timer);
  Wire.begin();
  Wire.setClock(400000); // Increase I2C data rate to 400kHz
  bno08x.begin_I2C();
  setReports();
  Serial.begin(115200);
}

void loop() {

  if (bno08x.wasReset()) {setReports();}
 while(bno08x.getSensorEvent(&sensorValue))
 {
  switch (sensorValue.sensorId) {
      case SH2_GYROSCOPE_CALIBRATED:
        imuReadings.angular_velocity.x=sensorValue.un.gyroscope.x;
        imuReadings.angular_velocity.y=sensorValue.un.gyroscope.y;
        imuReadings.angular_velocity.z=sensorValue.un.gyroscope.z;
        imuReadings.angular_velocity_covariance[2]=0.0000237068;
        isGyro=true;
        break;
      case SH2_LINEAR_ACCELERATION:
        imuReadings.linear_acceleration.x = sensorValue.un.accelerometer.x;
        imuReadings.linear_acceleration.y = sensorValue.un.accelerometer.y;
        imuReadings.linear_acceleration.z = sensorValue.un.accelerometer.z;
        imuReadings.linear_acceleration_covariance[0]=0.0162471;
        isAcc=true;
        break;
        case SH2_GAME_ROTATION_VECTOR:
        imuReadings.orientation.x=sensorValue.un.gameRotationVector.i;
        imuReadings.orientation.y=sensorValue.un.gameRotationVector.j;
        imuReadings.orientation.z=sensorValue.un.gameRotationVector.k;
        imuReadings.orientation.w=sensorValue.un.gameRotationVector.real;
        imuReadings.orientation_covariance[8]=0.0000000787;
        isRot=true;
        break;
   }
  }
 RCSOFTCHECK(rclc_executor_spin_some(&executor, RCL_MS_TO_NS(1)));
}
