import yaml
import time
import os
import rospy
from std_msgs.msg import Float32
from std_msgs.msg import Float32MultiArray
from sensor_msgs.msg import Imu
base_velocity=0.0
previous_velocity=0.0
pub_time= 0
current_time=None
imu_x=0.0
current_acceleration=0.0
Imu_accX_vector=[]
Odom_accX_vector=[]

def callback(msg):
    global current_acceleration
    global base_velocity
    global previous_velocity
    global pub_time
    global imu_x

    right_wheel_speed= msg.data[0]
    left_wheel_speed = msg.data[1]
    base_velocity = float((right_wheel_speed+left_wheel_speed)/2)
    current_time=rospy.get_time()
    if base_velocity<0.0:
        base_velocity =base_velocity*-1
    if pub_time==0:
        pub_time=rospy.get_time()
        previous_velocity=base_velocity
        return
    elif (current_time-pub_time) >0:
        current_acceleration=(base_velocity-previous_velocity)/(current_time-pub_time)
        Imu_accX_vector.append(imu_x)
        Odom_accX_vector.append(current_acceleration)
        pub_time=current_time
        previous_velocity=base_velocity
        pub_imu_acc.publish(imu_x)
        pub_odom_acc.publish(current_acceleration)
    
def imuCallback(msg):
     global imu_x
     global imu_y
     global imu_z
     imu_x=msg.linear_acceleration.x
     imu_y=msg.linear_acceleration.y
     imu_z=msg.linear_acceleration.z

print('start intialization')
rospy.init_node('acceleration_publisher')
pub_imu_acc = rospy.Publisher('/acc_data', Float32, queue_size=10)
pub_odom_acc = rospy.Publisher('/vel_data', Float32, queue_size=10)
rospy.Subscriber("wheel_speeds", Float32MultiArray, callback)
rospy.Subscriber('sensor_data',Imu,imuCallback)
print('Done intialization')

pub_freq =rospy.Rate(10)

try:
    time.sleep(2)  # Wait for 2 seconds to ensure the Arduino is ready

    while not rospy.is_shutdown():
        pub_freq.sleep()
except KeyboardInterrupt:
    print("Exiting...")
finally:
    os.makedirs(os.path.expanduser('~/data'), exist_ok=True)
    with open(os.path.expanduser('~/data/Imu_accX.yaml'), 'w') as file:
           yaml.dump(Imu_accX_vector, file)
    with open(os.path.expanduser('~/data/odom_accX.yaml'), 'w') as file:
           yaml.dump(Odom_accX_vector, file)
           print("Data saved to ~/data/Acc_sensor_data.yaml")


rospy.spin()
