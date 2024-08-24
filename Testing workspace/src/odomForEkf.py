import time
import rospy
from std_msgs.msg import Float32MultiArray
from nav_msgs.msg import Odometry
import math 

current_odom=Odometry()
pos_x=0.0
pos_y=0.0
i=0.0
j=0.0
k=0.0
w=0.0

def odomcallback(msg):
    print('cb funciton')
    global pos_x
    global pos_y
    global i
    global j
    global k
    global w
    pos_x=msg.pose.pose.position.x
    pos_y=msg.pose.pose.position.y
    i=msg.pose.pose.orientation.x
    j=msg.pose.pose.orientation.y
    k=msg.pose.pose.orientation.z
    w=msg.pose.pose.orientation.w
    

print("Initializing node...")
rospy.init_node('odom_pub_node')
rospy.Subscriber('/slamware_ros_sdk_server_node/odom',Odometry,odomcallback)
pub=rospy.Publisher('my_odom_publisher',Odometry,queue_size=10)
freq=rospy.Rate(10)
print('finished intialization')
try:
    while not rospy.is_shutdown():
        print('pub loop')
        current_odom.pose.pose.position.x=pos_x
        current_odom.pose.pose.position.y=pos_y
        current_odom.pose.pose.orientation.x=i
        current_odom.pose.pose.orientation.y=j
        current_odom.pose.pose.orientation.z=k
        current_odom.pose.pose.orientation.w=w
        current_odom.pose.covariance[0]=2 #for x-axis
        current_odom.pose.covariance[7]=2 #for y-axis
        current_odom.pose.covariance[35]=2 #for yaw
        current_odom.header.stamp = rospy.Time.now()  
        current_odom.header.frame_id='odom'
        current_odom.child_frame_id='base_link' 
        pub.publish(current_odom)
        freq.sleep()

except KeyboardInterrupt:
    print("Exiting...")      
