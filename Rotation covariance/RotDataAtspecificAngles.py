import serial
import yaml
import time
import os
import rospy
from std_msgs.msg import Float32MultiArray
from nav_msgs.msg import Odometry
from sensor_msgs.msg import Imu
import math 

ImuAngle = []
ImuAngleVector = []
ImuYawVector=[]
imu_yaw=0.0
odom_yaw=0.0
results_data=Float32MultiArray()
odom_x=0.0
odom_y=0.0
odom_z=0.0
odom_w=0.0
imu_x=0.0
imu_y=0.0
imu_z=0.0
imu_w=0.0
isreached=False

def odomcallback(msg):
    print("ODOM CALLLLLLBACK")
    global odom_x
    global odom_y
    global odom_z
    global odom_w
    global odom_yaw
    global isreached
    odom_x=msg.pose.pose.orientation.x
    odom_y=msg.pose.pose.orientation.y
    odom_z=msg.pose.pose.orientation.z
    odom_w=msg.pose.pose.orientation.w
    odom_yaw = (math.atan2(2 * (odom_w * odom_z + odom_x * odom_y), 1 - 2 * (odom_y * odom_y + odom_z * odom_z))) * 57.2958
    if (odom_x==0.0) and (odom_y==0.0) and (odom_z>=0.38 or odom_z<=0.4) and (odom_w>=0.9 or odom_w<=0.93):
        isreached=True


def imucallback(msg):
    print("sensor cb")
    global imu_x 
    global imu_y
    global imu_z
    global imu_w
    global imu_yaw
    global isreached
    imu_x= msg.orientation.x
    imu_y= msg.orientation.y
    imu_z= msg.orientation.z
    imu_w= msg.orientation.w
    imu_yaw = (math.atan2(2 * (imu_w * imu_z + imu_x * imu_y), 1 - 2 * (imu_y * imu_y + imu_z * imu_z))) * 57.2958
    if isreached:
        print("New data to be saved...")
        isreached=False
        ImuAngle=[imu_x,imu_y,imu_z,imu_w]
        ImuAngleVector.append(ImuAngle)
        ImuYawVector.append(imu_yaw)
        results_data.data = [imu_yaw, odom_yaw]
        pub.publish(results_data)



print("start config")
rospy.init_node('rotAngle_publisher')
rospy.Subscriber('/sensor_data', Imu, imucallback)
rospy.Subscriber('slamware_ros_sdk_server_node/odom', Odometry, odomcallback)
pub=rospy.Publisher('/results',Float32MultiArray,queue_size=10)
print("Done config")
try:
    time.sleep(2) 
    while not rospy.is_shutdown():
        pass
except KeyboardInterrupt:
    print("Exiting...")                    

with open(os.path.expanduser('~/data/Imu_Odom_angles.yaml'), 'w') as file:
    yaml.dump(ImuAngleVector, file)
with open(os.path.expanduser('~/data/Imu_Yaw_angles.yaml'), 'w') as file:
    yaml.dump(ImuYawVector, file)
print("Data saved to YAML files")

rospy.spin()
