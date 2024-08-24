import serial
import yaml
import time
import os
import rospy
from std_msgs.msg import Float32
from std_msgs.msg import Float32MultiArray
from sensor_msgs.msg import Imu

counter = 0
gyro_z=0.0
odom_z=0.0
gyro_z_vector=[]
odom_z_vector=[]

def wheel_speed_callback(msg):
    global odom_z
    global gyro_z
    odom_z=msg.data[0]
    gyro_z_vector.append(gyro_z)
    odom_z_vector.append(odom_z)
    gyro_odom_pub.publish(odom_z)
    gyro_imu_pub.publish(gyro_z)

def imu_callback(msg):
    global gyro_z
    gyro_z=msg.angular_velocity.z


rospy.init_node('gyro')
rospy.Subscriber('wheel_speeds',Float32MultiArray,wheel_speed_callback)
rospy.Subscriber('sensor_data',Imu,imu_callback)
gyro_odom_pub=rospy.Publisher("gyro_odom_pub", Float32, queue_size=10)
gyro_imu_pub=rospy.Publisher("gyro_imu_pub", Float32, queue_size=10)
rate=rospy.Rate(10)

try:
    time.sleep(2)  

    while (counter < 1000) and (not rospy.is_shutdown()):
            counter += 1  
            print(f"Counter incremented: {counter}")
            rate.sleep()

except KeyboardInterrupt:
    print("Exiting...")

finally:
    os.makedirs(os.path.expanduser('~/data'), exist_ok=True)
    with open(os.path.expanduser('~/data/Gyro_sensor_data.yaml'), 'w') as file:
        yaml.dump(gyro_z_vector, file)
    with open(os.path.expanduser('~/data/Gyro_odom_data.yaml'), 'w') as file:
        yaml.dump(odom_z_vector, file)
        print("Data saved")
