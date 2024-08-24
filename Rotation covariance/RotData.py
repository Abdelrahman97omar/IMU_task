import serial
import yaml
import time
import os
import rospy
from std_msgs.msg import Float32MultiArray
from nav_msgs.msg import Odometry
from sensor_msgs.msg import Imu
import math 

angles= Float32MultiArray()
angles.data = [0.0, 0.0] 

odomAngle = []
odomAngleaVector = []

ImuAngle = []
ImuAngleVector = []

odom_yaw = 0
imu_yaw = 0
imu_yaw_vector=[]
odom_yaw_vector=[]

imu_x=0.0
imu_y=0.0
imu_z=0.0
imu_w=0.0

odom_x=0.0
odom_y=0.0
odom_z=0.0
odom_w=0.0

def callback(msg):
    print("odom_callback")
    global odomAngle
    global odomAngleaVector
    global ImuAngle
    global ImuAngleVector
    global odom_x
    global odom_y
    global odom_z
    global odom_w
    global imu_x
    global imu_y
    global imu_z
    global imu_w
    global odom_yaw 
    global imu_yaw
    odom_x=msg.pose.pose.orientation.x 
    odom_y=msg.pose.pose.orientation.y
    odom_z=msg.pose.pose.orientation.z
    odom_w=msg.pose.pose.orientation.w
    odom_yaw = (math.atan2(2 * (odom_w * odom_z + odom_x * odom_y), 1 - 2 * (odom_y* odom_y + odom_z * odom_z))) * 57.2958
    print("saving data...") 
    ImuAngle = [imu_x, imu_y, imu_z, imu_w,imu_yaw]  
    ImuAngleVector.append(ImuAngle)
    odomAngle=[odom_x,odom_y,odom_z,odom_w,odom_yaw]
    odomAngleaVector.append(odomAngle)
    angles.data[0]=imu_yaw
    angles.data[1]=odom_yaw
    pub.publish(angles)
    imu_yaw_vector.append(imu_yaw)
    odom_yaw_vector.append(odom_yaw)
    print("data saved")

def imu_callback(msg):
    print("imu call back")
    global imu_x
    global imu_y
    global imu_z
    global imu_w
    global imu_yaw
    imu_x = msg.orientation.x
    imu_y = msg.orientation.y
    imu_z = msg.orientation.z
    imu_w = msg.orientation.w
    imu_yaw = (math.atan2(2 * (imu_w * imu_z + imu_x * imu_y), 1 - 2 * (imu_y* imu_y + imu_z * imu_z))) * 57.2958

rospy.init_node('rotAngle_publisher')
rospy.Subscriber('/slamware_ros_sdk_server_node/odom', Odometry, callback)
rospy.Subscriber('/sensor_data', Imu, imu_callback)
pub=rospy.Publisher('/angle_vaues',Float32MultiArray, queue_size=10)

try:
    time.sleep(2) 
    while not rospy.is_shutdown():
        pass
except KeyboardInterrupt:
    print("Exiting...")                    

os.makedirs(os.path.expanduser('~/data'), exist_ok=True)
# with open(os.path.expanduser('~/data/odom_angles.yaml'), 'w') as file:
    # yaml.dump(odomAngleaVector, file)
# with open(os.path.expanduser('~/data/Imu_angles.yaml'), 'w') as file:
    # yaml.dump(ImuAngleVector, file)
with open(os.path.expanduser('~/data/Imu_angles_Yaw.yaml'), 'w') as file:
    yaml.dump(imu_yaw_vector, file)
with open(os.path.expanduser('~/data/odom_angles_Yaw.yaml'), 'w') as file:
    yaml.dump(odom_yaw_vector, file)
print("Data saved to YAML files")

rospy.spin()
